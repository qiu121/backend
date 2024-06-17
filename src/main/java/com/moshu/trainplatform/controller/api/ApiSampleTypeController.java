package com.moshu.trainplatform.controller.api;

import com.moshu.trainplatform.constant.exception.BizException;
import com.moshu.trainplatform.constant.exception.EmBizError;
import com.moshu.trainplatform.dto.SampleTypeDTO;
import com.moshu.trainplatform.entity.SampleType;
import com.moshu.trainplatform.service.SampleTypeService;
import com.moshu.trainplatform.template.SuccessResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import java.util.List;
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

    @GetMapping("/list")
    @RequiresRoles(value = {"admin", "maintain","user"}, logical = Logical.OR)
    public SuccessResponse list() {
        List<SampleType> list = sampleTypeService.list();
        SuccessResponse response = new SuccessResponse(200);
        response.put("result", list);
        return response;
    }

    @PostMapping("/add")
    @RequiresRoles("admin")
    public SuccessResponse add(@RequestBody SampleTypeDTO sampleTypeDTO) throws BizException {

        validate(sampleTypeDTO);

        SampleType sampleType = new SampleType(sampleTypeDTO);
        boolean save = sampleTypeService.save(sampleType);
        return new SuccessResponse(200);
    }

    @DeleteMapping("/del/{sampleTypeId}")
    @RequiresRoles("admin")
    public SuccessResponse del(@PathVariable Long sampleTypeId) {
        boolean remove = sampleTypeService.removeById(sampleTypeId);
        log.debug("=============remove: {}", remove);

        return new SuccessResponse(200);
    }

    @PutMapping("/update")
    @RequiresRoles("admin")
    public SuccessResponse update(@RequestBody SampleTypeDTO sampleTypeDTO) throws BizException {

        validate(sampleTypeDTO);
        SampleType sampleType = new SampleType(sampleTypeDTO);

        boolean update = sampleTypeService.updateById(sampleType);
        log.debug("===============update: {}", update);

        return new SuccessResponse(200);
    }

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
