package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.Record;
import com.moshu.trainplatform.mapper.RecordMapper;
import com.moshu.trainplatform.service.RecordService;
import com.moshu.trainplatform.vo.RecordVO;
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
public class RecordServiceImpl extends ServiceImpl<RecordMapper, Record> implements RecordService {
    @Resource
    private RecordMapper recordMapper;


    @Override
    public List<RecordVO> listRecord() {
        return recordMapper.listRecord();
    }

    @Override
    public List<RecordVO> listRecordByUserId(String userId) {
        return recordMapper.listRecordByUserId(userId);
    }
}
