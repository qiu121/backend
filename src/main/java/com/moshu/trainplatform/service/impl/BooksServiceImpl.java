package com.moshu.trainplatform.service.impl;

import com.moshu.trainplatform.entity.Books;
import com.moshu.trainplatform.mapper.BooksMapper;
import com.moshu.trainplatform.service.IBooksService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author to_Geek
* @date 2025/03/18
* @version 1.0
*/
@Service
@Transactional(rollbackFor = Throwable.class)
public class BooksServiceImpl extends ServiceImpl<BooksMapper, Books> implements IBooksService {

}
