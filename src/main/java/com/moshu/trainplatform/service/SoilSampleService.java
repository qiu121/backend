package com.moshu.trainplatform.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.moshu.trainplatform.entity.SoilSample;
import com.moshu.trainplatform.vo.SoilSampleVO;

import java.util.List;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
public interface SoilSampleService extends IService<SoilSample> {
    List<SoilSampleVO> listByRecordId(IPage<SoilSampleVO>page,Long recordId);
}
