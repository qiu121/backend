package com.moshu.trainplatform.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.moshu.trainplatform.entity.UserRole;

public interface UserRoleService extends IService<UserRole> {

    UserRole getUserRoleByUserId(String userId);

}
