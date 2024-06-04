package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.SampleType;
import com.moshu.trainplatform.mapper.SampleTypeMapper;
import com.moshu.trainplatform.service.SampleTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/06/03
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class SampleTypeServiceImpl extends ServiceImpl<SampleTypeMapper, SampleType> implements SampleTypeService {
}
