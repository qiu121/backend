package com.moshu.trainplatform.mapper;

import com.moshu.trainplatform.entity.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface PermissionMapper {

    @Select("SELECT p.* FROM role_permission rp " +
            "INNER JOIN permission p on rp.permissionId = p.permissionId " +
            "WHERE rp.roleId = #{roleId}")
    List<Map<String,Object>> getPermissionInfo(@Param("roleId") Integer roleId);

    @Select("SELECT pa.* from permission p " +
            "INNER JOIN permission_action pa on p.permissionId = pa.permissionId " +
            " WHERE p.permissionId = #{permissionId}")
    List<Map<String,Object>> getPermissionsActionsInfo(@Param("permissionId") Integer permissionId);


    @Select("SELECT p.* FROM role_permission rp " +
            "INNER JOIN permission p on rp.permission_id = p.permission_id " +
            "WHERE rp.role_id = #{roleId}")
    List<Permission> getPermissionInfoByReact(@Param("roleId") Integer roleId);
}