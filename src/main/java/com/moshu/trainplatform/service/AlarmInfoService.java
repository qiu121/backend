package com.moshu.trainplatform.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.moshu.trainplatform.entity.AlarmInfo;

import java.util.List;

public interface AlarmInfoService extends IService<AlarmInfo> {

    List<AlarmInfo> getAllAlarmInfoByModule(String module);

}
