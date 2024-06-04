package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.moshu.trainplatform.entity.ModuleAttachment;
import com.moshu.trainplatform.service.ModuleAttachmentService;
import com.moshu.trainplatform.template.SuccessResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/api/moduleAttachment")
public class ApiModuleAttachmentController {

    @Autowired
    ModuleAttachmentService moduleAttachmentService;

    @GetMapping("/getAttachments")
    @ResponseBody
    public SuccessResponse getAttachment(@RequestParam("type") String type) {
        SuccessResponse sr = new SuccessResponse(200);
        LambdaQueryWrapper<ModuleAttachment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ModuleAttachment::getType, type);
        List<ModuleAttachment> list = moduleAttachmentService.list(wrapper);
        sr.put("result", list);
        return sr;
    }
}
