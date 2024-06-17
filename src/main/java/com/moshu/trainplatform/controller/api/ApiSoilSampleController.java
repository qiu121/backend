package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.moshu.trainplatform.aop.BussinessLog;
import com.moshu.trainplatform.aop.LogType;
import com.moshu.trainplatform.dto.PageDTO;
import com.moshu.trainplatform.entity.Record;
import com.moshu.trainplatform.entity.SoilSample;
import com.moshu.trainplatform.service.RecordService;
import com.moshu.trainplatform.service.SoilSampleService;
import com.moshu.trainplatform.template.SuccessResponse;
import com.moshu.trainplatform.vo.SoilSampleVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/06/06
 */
@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/soilSample")
public class ApiSoilSampleController {
    private final SoilSampleService soilSampleService;
    private final RecordService recordService;

    /**
     * 分页查询记录下的土壤样本
     *
     * @param pageDTO  分页入参
     * @param recordId 实验记录 id
     * @return
     */
    @PostMapping("/list/{recordId}")
    @BussinessLog(module = LogType.LIST_SAMPLE_RECORD_ID)
    public SuccessResponse get(@RequestBody PageDTO pageDTO, @PathVariable Long recordId) {

        Integer currentPage = pageDTO.getCurrentPage();
        Integer pageSize = pageDTO.getPageSize();

        Page<SoilSampleVO> page = new Page<>(currentPage, pageSize);
        List<SoilSampleVO> list = soilSampleService.listByRecordId(page, recordId);
        SuccessResponse response = new SuccessResponse(200);
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("result", list);
        hashMap.put("total", page.getTotal());
        response.setData(hashMap);

        return response;
    }

    /**
     * 添加土壤样本记录
     *
     * @param soilSample 土壤样本类
     * @return
     */
    @PostMapping("/add")
    @BussinessLog(module = LogType.ADD_SAMPLE)
    public SuccessResponse add(@RequestBody SoilSample soilSample) {

        boolean save = soilSampleService.save(soilSample);
        log.debug("save = {}", save);

        // 更新实验记录提交时间、提交数据状态
        LambdaUpdateWrapper<Record> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.eq(Record::getId, soilSample.getRecordId())
                .set(Record::getSubmitTime, LocalDateTime.now())
                .set(Record::getStatus, "已完成");
        recordService.update(updateWrapper);

        return new SuccessResponse(200);
    }

    /**
     * 更新土壤样本数据
     *
     * @param soilSample 土壤样本类
     * @return
     */
    @PutMapping("/update")
    @BussinessLog(module = LogType.UPDATE_SAMPLE)
    public SuccessResponse update(@RequestBody SoilSample soilSample) {

        boolean update = soilSampleService.updateById(soilSample);

        // 更新样本时，同步更新实验记录-修改时间
        LambdaUpdateWrapper<Record> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.eq(Record::getId, soilSample.getRecordId())
                .set(Record::getUpdateTime, LocalDateTime.now());
        boolean updated = recordService.update(updateWrapper);

        log.debug("update={}", update && updated);
        return new SuccessResponse(200);
    }

    /**
     * 根据土壤样本id删除
     *
     * @param soilSampleId 土壤样本id
     * @return
     */
    @DeleteMapping("/del/{soilSampleId}")
    @BussinessLog(module = LogType.REMOVE_SAMPLE)
    public SuccessResponse del(@PathVariable Long soilSampleId) {

        // 获取到相应的 recordId,便于修改对应的 record 数据状态
        SoilSample soilSample = soilSampleService.getById(soilSampleId);
        Long recordId = soilSample.getRecordId();

        boolean remove = soilSampleService.removeById(soilSampleId);
        log.debug("remove={}", remove);

        /*
            若执行删除后，删除的样本所对应的实验记录下的 样本数为0
            则将对应 实验记录状态 也同步修改
         */
        int count = soilSampleService.count(new LambdaQueryWrapper<SoilSample>().eq(SoilSample::getRecordId, recordId));
        LambdaUpdateWrapper<Record> updateWrapper = new LambdaUpdateWrapper<>();
        String newStatus = "待完成";
        if (count == 0) {
            updateWrapper.eq(Record::getId, recordId)
                    .set(Record::getSubmitTime, null)
                    .set(Record::getStatus, newStatus);
        }
        boolean updated = recordService.update(updateWrapper);
        log.debug("updated={}", updated);
        return new SuccessResponse(200);
    }
}



