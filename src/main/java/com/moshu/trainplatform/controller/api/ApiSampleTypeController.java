package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.moshu.trainplatform.aop.BussinessLog;
import com.moshu.trainplatform.aop.LogType;
import com.moshu.trainplatform.constant.exception.BizException;
import com.moshu.trainplatform.constant.exception.EmBizError;
import com.moshu.trainplatform.dto.PageDTO;
import com.moshu.trainplatform.dto.SampleTypeDTO;
import com.moshu.trainplatform.entity.SampleType;
import com.moshu.trainplatform.service.SampleTypeService;
import com.moshu.trainplatform.template.SuccessResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/06/03
 */
@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/sampleType")
public class ApiSampleTypeController {

    private final SampleTypeService sampleTypeService;

    @PostMapping("/list")
    @BussinessLog(module = LogType.LIST_SAMPLE_TYPE)
    @RequiresRoles(value = {"admin", "maintain", "user"}, logical = Logical.OR)
    public SuccessResponse list(@RequestBody(required = false) PageDTO pageDTO) {

        Page<SampleType> page;
        if (pageDTO != null && pageDTO.getCurrentPage() != null && pageDTO.getPageSize() != null) {
            page = new Page<>(pageDTO.getCurrentPage(), pageDTO.getPageSize());

        } else {
            page = new Page<>();
        }
        Page<SampleType> typePage = sampleTypeService.page(page, new QueryWrapper<>());

        SuccessResponse response = new SuccessResponse(200);
        response.put("result", typePage.getRecords());
        response.put("total", typePage.getTotal());
        return response;
    }

    @PostMapping("/add")
    @RequiresRoles("admin")
    @BussinessLog(module = LogType.ADD_SAMPLE_TYPE)
    public SuccessResponse add(@RequestBody SampleTypeDTO sampleTypeDTO) throws BizException {

        validate(sampleTypeDTO);

        SampleType sampleType = new SampleType(sampleTypeDTO);
        boolean save = sampleTypeService.save(sampleType);
        log.debug("save :{}", save);
        return new SuccessResponse(200);
    }

    @DeleteMapping("/del/{sampleTypeId}")
    @RequiresRoles("admin")
    @BussinessLog(module = LogType.REMOVE_SAMPLE_TYPE)
    public SuccessResponse del(@PathVariable Long sampleTypeId) {
        boolean remove = sampleTypeService.removeById(sampleTypeId);
        log.debug("=============remove: {}", remove);

        return new SuccessResponse(200);
    }

    @PutMapping("/update")
    @RequiresRoles("admin")
    @BussinessLog(module = LogType.UPDATE_SAMPLE_TYPE)
    public SuccessResponse update(@RequestBody SampleTypeDTO sampleTypeDTO) throws BizException {

        validate(sampleTypeDTO);
        SampleType sampleType = new SampleType(sampleTypeDTO);

        boolean update = sampleTypeService.updateById(sampleType);
        log.debug("===============update: {}", update);

        return new SuccessResponse(200);
    }

    /**
     * 校验重复数据
     *
     * @param sampleTypeDTO 样本类型DTO参数
     * @throws BizException 自定义异常类
     */
    private void validate(SampleTypeDTO sampleTypeDTO) throws BizException {
        String sampleTypeName = sampleTypeDTO.getSampleTypeName();
        Set<String> sampleTypeNameList = sampleTypeService.list().stream()
                .map(SampleType::getSampleTypeName)
                .collect(Collectors.toSet());

        if (sampleTypeNameList.contains(sampleTypeName)) {
            throw new BizException(EmBizError.DUPLICATE_DATA_ERROR);
        }
    }

}
