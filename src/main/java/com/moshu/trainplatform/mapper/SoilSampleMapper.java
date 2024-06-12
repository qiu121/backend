package com.moshu.trainplatform.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.moshu.trainplatform.entity.SoilSample;
import com.moshu.trainplatform.vo.SoilSampleVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
@Mapper
public interface SoilSampleMapper extends BaseMapper<SoilSample> {

    List<SoilSampleVO> listByRecordId(IPage<SoilSampleVO>page,Long recordId);
}