package com.moshu.trainplatform.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.moshu.trainplatform.entity.Role;
import com.moshu.trainplatform.mapper.RoleMapper;
import com.moshu.trainplatform.service.RoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
