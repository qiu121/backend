package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.SoilSample;
import com.moshu.trainplatform.mapper.SoilSampleMapper;
import com.moshu.trainplatform.service.SoilSampleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class SoilSampleServiceImpl extends ServiceImpl<SoilSampleMapper, SoilSample> implements SoilSampleService {
}
