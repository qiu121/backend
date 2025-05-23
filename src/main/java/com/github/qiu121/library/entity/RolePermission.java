package com.github.qiu121.library.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 产品册字段表实体类
 */
@Data
public class RolePermission {

    @TableId(type = IdType.AUTO)
    private Integer rolePermissionId;

    private Integer permissionId;

    private Integer roleId;
}
