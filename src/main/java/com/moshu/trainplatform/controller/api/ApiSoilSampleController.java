package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
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
    @GetMapping("/list/{recordId}")
    public SuccessResponse get(@PathVariable Long recordId) {

        List<SoilSampleVO> list = soilSampleService.listByRecordId(recordId);
        SuccessResponse response = new SuccessResponse(200);
        response.put("result", list);

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
                .set(Record::getSubmitTime, LocalDateTime.now());
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
        boolean remove = soilSampleService.removeById(soilSampleId);
        log.debug("remove={}", remove);
        return new SuccessResponse(200);
    }
}



