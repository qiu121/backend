package com.moshu.trainplatform.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.FileInfo;
import com.moshu.trainplatform.mapper.FileInfoMapper;
import com.moshu.trainplatform.service.FileInfoService;
import org.springframework.stereotype.Service;

@Service
public class FileInfoServiceImpl extends ServiceImpl<FileInfoMapper, FileInfo> implements FileInfoService {

}
