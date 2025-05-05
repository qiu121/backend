package com.github.qiu121.library.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.qiu121.library.entity.Log;
import com.github.qiu121.library.mapper.LogMapper;
import com.github.qiu121.library.service.LogService;
import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements LogService {

}
