package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.SoilSample;
import com.moshu.trainplatform.mapper.SoilSampleMapper;
import com.moshu.trainplatform.service.SoilSampleService;
import com.moshu.trainplatform.vo.SoilSampleVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class SoilSampleServiceImpl extends ServiceImpl<SoilSampleMapper, SoilSample> implements SoilSampleService {
    @Resource
    private SoilSampleMapper soilSampleMapper;
    @Override
    public List<SoilSampleVO> listByRecordId(IPage<SoilSampleVO>page,Long recordId) {
        return soilSampleMapper.listByRecordId(page,recordId);
    }
}
