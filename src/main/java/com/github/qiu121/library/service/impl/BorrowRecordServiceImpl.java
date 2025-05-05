package com.github.qiu121.library.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.qiu121.library.entity.BorrowRecord;
import com.github.qiu121.library.mapper.BorrowRecordMapper;
import com.github.qiu121.library.service.IBorrowRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author to_Geek
 * @version 1.0
 * @date 2025/03/25
 */
@Service
@Transactional(rollbackFor = Throwable.class)
public class BorrowRecordServiceImpl extends ServiceImpl<BorrowRecordMapper, BorrowRecord> implements IBorrowRecordService {

}
