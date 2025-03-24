package com.moshu.trainplatform.service.impl;

import com.moshu.trainplatform.entity.BorrowRecord;
import com.moshu.trainplatform.mapper.BorrowRecordMapper;
import com.moshu.trainplatform.service.IBorrowRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author to_Geek
* @date 2025/03/25
* @version 1.0
*/
@Service
@Transactional(rollbackFor = Throwable.class)
public class BorrowRecordServiceImpl extends ServiceImpl<BorrowRecordMapper, BorrowRecord> implements IBorrowRecordService {

}
