package com.moshu.trainplatform.controller.api;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.moshu.trainplatform.entity.Notification;
import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.mapper.NotificationMapper;
import com.moshu.trainplatform.service.NotificationService;
import com.moshu.trainplatform.template.SuccessResponse;
import com.moshu.trainplatform.utils.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Controller
@RequestMapping("/api/notification")
public class ApiNotificationController {
    @Autowired
    RedisTemplate redisTemplate;

    @Autowired
    NotificationMapper notificationMapper;

    @Autowired
    private NotificationService notificationService;


    @GetMapping("/get")
    @ResponseBody
    public SuccessResponse get() {
        SuccessResponse sr = new SuccessResponse(200);
        sr.put("result", notificationService.list());
        return sr;
    }

    @GetMapping("/getOwn")
    @ResponseBody
    public SuccessResponse getOwn() {
        ValueOperations<String, Object> ops = redisTemplate.opsForValue();
        UserInfo userInfo = (UserInfo) ops.get("userInfo:token:" + new Token().getToken());

        SuccessResponse sr = new SuccessResponse(200);
        sr.put("result", notificationMapper.getOwn(Objects.requireNonNull(userInfo).getUserId()));
        return sr;
    }


    @GetMapping("/getById")
    @ResponseBody
    public SuccessResponse getById(@RequestParam List<String> ids) {
        SuccessResponse sr = new SuccessResponse(200);
        sr.put("result", notificationService.listByIds(ids));
        return sr;
    }

    @GetMapping("/getByUserId")
    @ResponseBody
    public SuccessResponse getByUserId(@RequestParam List<String> ids) {
        LambdaQueryWrapper<Notification> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(!ids.isEmpty(), Notification::getId, ids);

        SuccessResponse sr = new SuccessResponse(200);
        sr.put("result", notificationService.list(wrapper));
        return sr;
    }

    @PostMapping("/add")
    @ResponseBody
    public SuccessResponse add(@RequestBody Notification notification) {
        SuccessResponse sr = new SuccessResponse(200);
        notification.setId(UUID.randomUUID().toString());
        notification.setStatus("unread");
        sr.put("result", notificationService.save(notification));
        return sr;
    }

    @PostMapping("/update")
    @ResponseBody
    public SuccessResponse update(@RequestBody Notification notification) {
        SuccessResponse sr = new SuccessResponse(200);
        sr.put("result", notificationService.updateById(notification));
        return sr;
    }
}
