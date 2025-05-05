package com.github.qiu121.library.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.qiu121.library.entity.UserRole;

public interface UserRoleService extends IService<UserRole> {

    UserRole getUserRoleByUserId(String userId);

}
