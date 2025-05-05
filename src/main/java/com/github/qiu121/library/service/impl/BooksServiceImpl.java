package com.github.qiu121.library.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.qiu121.library.entity.Books;
import com.github.qiu121.library.mapper.BooksMapper;
import com.github.qiu121.library.service.IBooksService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author to_Geek
 * @version 1.0
 * @date 2025/03/18
 */
@Service
@Transactional(rollbackFor = Throwable.class)
public class BooksServiceImpl extends ServiceImpl<BooksMapper, Books> implements IBooksService {

}
