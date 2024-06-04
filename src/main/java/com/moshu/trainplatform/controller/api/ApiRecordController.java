package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.moshu.trainplatform.dto.RecordDTO;
import com.moshu.trainplatform.entity.Record;
import com.moshu.trainplatform.entity.SoilSample;
import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.service.RecordService;
import com.moshu.trainplatform.service.SoilSampleService;
import com.moshu.trainplatform.template.SuccessResponse;
import com.moshu.trainplatform.utils.UserUtil;
import com.moshu.trainplatform.vo.SoilSampleVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/record")
public class ApiRecordController {

    private final RecordService recordService;
    private final SoilSampleService soilSampleService;

    /**
     * 查询个人
     *
     * @return
     */
    @GetMapping("/getAll")
    @RequiresRoles({"admin"})
    public SuccessResponse getAll() {
        SuccessResponse response = new SuccessResponse(200);

        // 返回格式转换
        List<Record> recordList = recordService.list().stream()
                .peek(record -> {
                    LambdaQueryWrapper<SoilSample> wrapper = new LambdaQueryWrapper<>();
                    wrapper.eq(SoilSample::getRecordId, record.getId());

                    List<SoilSampleVO> soilSampleVOList = soilSampleService.list(wrapper).stream()
                            .map(SoilSampleVO::new)
                            .collect(Collectors.toList());
                    record.setSampleList(soilSampleVOList);
                }).collect(Collectors.toList());


        response.put("result", recordList);
        return response;
    }

    @GetMapping("/get")
    @RequiresRoles({"user"})
    public SuccessResponse get() {

        // 条件查询出访问用户的记录
        UserInfo user = UserUtil.getUserInfoByToken();
        String userName = user.getUserName();
        LambdaQueryWrapper<Record> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Record::getUsername, userName);
        List<Record> list = recordService.list(queryWrapper);

        List<Record> recordList = list.stream()
                .peek(record -> {
                    LambdaQueryWrapper<SoilSample> wrapper = new LambdaQueryWrapper<>();
                    wrapper.eq(SoilSample::getRecordId, record.getId());

                    List<SoilSampleVO> soilSampleVOList = soilSampleService.list(wrapper).stream()
                            .map(SoilSampleVO::new)
                            .collect(Collectors.toList());
                    record.setSampleList(soilSampleVOList);
                }).collect(Collectors.toList());


        SuccessResponse response = new SuccessResponse(200);
        response.put("result", recordList);
        return response;
    }

    /**
     * 添加
     *
     * @param soilSample 土壤样本
     * @return 这里获取需要分拆为三个表单(三个样本)/三次提交表单 ✅
     */
    @PostMapping("/add")
    public SuccessResponse add(@RequestBody SoilSample soilSample) {


        // 记录填写人的 用户名(学号),id主键
        UserInfo user = UserUtil.getUserInfoByToken();
        String userName = user.getUserName();
        String userId = user.getUserId();

        // 记录表，一个用户只需要记录一次,这里不给出重复插入提示，已存在的数据不进行处理，其他正常插入
        // 如果记录已经存在，获取记录id 作为返回的主键，插入到 soilSample的record_id,将其关联起来
        Record one = recordService.getOne(new LambdaQueryWrapper<Record>()
                .eq(true, Record::getUsername, userName));
        if (one != null) {
            soilSample.setRecordId(one.getId());
            soilSampleService.save(soilSample);
            return new SuccessResponse(200);
        }
        // 保存记录
        Record record = new Record();
        record.setUsername(userName);
        record.setUserId(userId);
        recordService.save(record);

        // 保存样本
        soilSample.setRecordId(record.getId());
        soilSampleService.save(soilSample);
        return new SuccessResponse(200);
    }

    /**
     * 按id删除
     *
     * @param recordId
     * @return
     */
    @DeleteMapping("/del/{recordId}")
    public SuccessResponse del(@PathVariable Long recordId) {

        /// 尝试逻辑删除
        /// Record record = new Record();
        /// record.setIsDeleted(1);
        boolean remove = recordService.removeById(recordId);

        LambdaQueryWrapper<SoilSample> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SoilSample::getRecordId, recordId);
        boolean removed = soilSampleService.remove(wrapper);

        log.debug("======执行删除==========：{}", remove && removed);

        return new SuccessResponse(200);
    }

    /**
     * 更新 样本数据
     *
     * @param soilSample
     * @return
     */
    @PutMapping("/update")
    public SuccessResponse update(@RequestBody RecordDTO recordDTO) {

        // 同步更新记录的时间
        Record record = new Record();
        record.setId(recordDTO.getId());
        record.setUpdateTime(LocalDateTime.now());

        log.error("dddddddddddd{}",record);
        recordService.updateById(record);

        List<SoilSampleVO> sampleList = recordDTO.getSampleList();

        // boolean save = soilSampleService.updateById(soilSample);

        // log.debug("==============更新操作===========：{}",save);
        return new SuccessResponse(200);

    }
}
