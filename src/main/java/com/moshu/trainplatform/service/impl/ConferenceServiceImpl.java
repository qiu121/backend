package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.Conference;
import com.moshu.trainplatform.mapper.ConferenceMapper;
import com.moshu.trainplatform.service.ConferenceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/22
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ConferenceServiceImpl extends ServiceImpl<ConferenceMapper, Conference> implements ConferenceService {
}
