package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.AlarmInfo;
import com.moshu.trainplatform.mapper.AlarmInfoMapper;
import com.moshu.trainplatform.service.AlarmInfoService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlarmInfoServiceImpl extends ServiceImpl<AlarmInfoMapper, AlarmInfo> implements AlarmInfoService {

    @Override
    public List<AlarmInfo> getAllAlarmInfoByModule(String module) {
        LambdaQueryWrapper<AlarmInfo> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(AlarmInfo::getModule, module);
        return this.list(queryWrapper);
    }

}
