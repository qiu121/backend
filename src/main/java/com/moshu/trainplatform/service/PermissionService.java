package com.moshu.trainplatform.service;


import com.moshu.trainplatform.entity.Permission;

import java.util.List;
import java.util.Map;

public interface PermissionService {

   // 根据权限id获取功能授权
   List<Map<String,Object>> getPermissionInfo(Integer roleId);

   List<Permission> getPermissionInfoByReact(Integer roleId);

}
