package com.github.qiu121.library.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.qiu121.library.entity.Role;
import com.github.qiu121.library.mapper.RoleMapper;
import com.github.qiu121.library.service.RoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
