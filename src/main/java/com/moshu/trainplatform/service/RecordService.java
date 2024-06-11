package com.moshu.trainplatform.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.moshu.trainplatform.entity.Record;
import com.moshu.trainplatform.vo.RecordVO;

import java.util.List;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
public interface RecordService extends IService<Record> {

    List<RecordVO> listRecord();

    List<RecordVO> listRecordByUserId(String userId);
}
