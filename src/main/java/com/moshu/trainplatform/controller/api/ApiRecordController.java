package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.moshu.trainplatform.aop.BussinessLog;
import com.moshu.trainplatform.aop.LogType;
import com.moshu.trainplatform.dto.RecordDTO;
import com.moshu.trainplatform.entity.Record;
import com.moshu.trainplatform.entity.SoilSample;
import com.moshu.trainplatform.service.RecordService;
import com.moshu.trainplatform.service.SoilSampleService;
import com.moshu.trainplatform.template.SuccessResponse;
import com.moshu.trainplatform.vo.RecordVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @GetMapping("/listRecord")
    @RequiresRoles({"admin"})
    @BussinessLog(module = LogType.LIST_RECORD)
    public SuccessResponse list() {
        SuccessResponse response = new SuccessResponse(200);

        List<RecordVO> list = recordService.listRecord();
        response.put("result", list);
        return response;
    }

    @GetMapping("/getRecord/{userId}")
    @RequiresRoles({"user"})
    @BussinessLog(module = LogType.GET_RECORD_USER_ID)
    public SuccessResponse getRecord(@PathVariable String userId) {
        SuccessResponse response = new SuccessResponse(200);
        List<RecordVO> list = recordService.getRecordByUserId(userId);
        response.put("result", list);
        return response;
    }

    @GetMapping("/listRecordByUserId/{userId}")
    @RequiresRoles(value = {"user", "admin"}, logical = Logical.OR)
    @BussinessLog(module = LogType.LIST_RECORD_DETAIL_USER_ID)
    public SuccessResponse get(@PathVariable String userId) {

        List<RecordVO> list = recordService.listRecordByUserId(userId);
        SuccessResponse response = new SuccessResponse(200);
        response.put("result", list);
        return response;
    }

    /**
     * 添加
     *
     * @param recordDTO 实验记录
     * @return result
     */
    @PostMapping("/add")
    @RequiresRoles(value = {"admin", "user"}, logical = Logical.OR)
    @BussinessLog(module = LogType.ADD_RECORD)
    public SuccessResponse add(@RequestBody RecordDTO recordDTO) {

        Record record = new Record(recordDTO);

        recordService.save(record);
        return new SuccessResponse(200);
    }

    /**
     * 按id删除
     *
     * @param recordId
     * @return
     */
    @DeleteMapping("/del/{recordId}")
    @RequiresRoles(value = {"admin", "user"}, logical = Logical.OR)
    @BussinessLog(module = LogType.REMOVE_RECORD)
    public SuccessResponse del(@PathVariable Long recordId) {

        /// 尝试逻辑删除
        /// Record record = new Record();
        /// record.setIsDeleted(1);
        int count = soilSampleService.count(new LambdaUpdateWrapper<SoilSample>()
                .eq(SoilSample::getRecordId, recordId));
        if (count != 0) {
            return new SuccessResponse(403, "数据不为空，不允许操作");
        }
        boolean remove = recordService.removeById(recordId);
        log.debug("remove = {}", remove);
        return new SuccessResponse(200);
    }

    /**
     * 更新 样本数据
     *
     * @param recordDTO
     * @return
     */
    @PutMapping("/update")
    @RequiresRoles(value = {"admin", "user"}, logical = Logical.OR)
    @BussinessLog(module = LogType.UPDATE_RECORD)
    public SuccessResponse update(@RequestBody RecordDTO recordDTO) {
        Record record = new Record(recordDTO);

        boolean update = recordService.updateById(record);
        log.debug("update = {}", update);
        return new SuccessResponse(200);

    }
}
