package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
     * 查询记录下的土壤样本
     *
     * @param recordId
     * @return
     */
    @PostMapping("/list/{recordId}")
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
    public SuccessResponse add(@RequestBody SoilSample soilSample) {

        boolean save = soilSampleService.save(soilSample);
        log.debug("save = {}", save);

        // 更新实验记录提交时间
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
    public SuccessResponse update(@RequestBody SoilSample soilSample) {

        boolean update = soilSampleService.updateById(soilSample);

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
    public SuccessResponse del(@PathVariable Long soilSampleId) {

        SoilSample soilSample = soilSampleService.getById(soilSampleId);
        Long recordId = soilSample.getRecordId();

        boolean remove = soilSampleService.removeById(soilSampleId);
        log.debug("remove={}", remove);

        int count = soilSampleService.count(new LambdaQueryWrapper<SoilSample>().eq(SoilSample::getRecordId, recordId));
        LambdaUpdateWrapper<Record> updateWrapper = new LambdaUpdateWrapper<>();
        String newStatus = "待完成";
        if (count == 0) {
            updateWrapper.eq(Record::getId, recordId)
                    .set(Record::getSubmitTime, null)
                    .set(Record::getStatus, newStatus);
        }
        boolean update = recordService.update(updateWrapper);
        log.error("update={}", update);

        return new SuccessResponse(200);
    }
}



