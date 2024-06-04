package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.Notification;
import com.moshu.trainplatform.mapper.NotificationMapper;
import com.moshu.trainplatform.service.NotificationService;
import org.springframework.stereotype.Service;


@Service
public class NotificationServiceImpl extends ServiceImpl<NotificationMapper, Notification> implements NotificationService {
}
