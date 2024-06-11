package com.moshu.trainplatform.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.moshu.trainplatform.entity.Record;
import com.moshu.trainplatform.vo.RecordVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
@Mapper
public interface RecordMapper extends BaseMapper<Record> {

    List<RecordVO> listRecord();

    List<RecordVO> listRecordByUserId(@Param("userId") String userId);
}