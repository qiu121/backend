package com.github.qiu121.library.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 产品册字段表实体类
 */
@Data
public class PermissionAction {
    @TableId(type = IdType.AUTO)
    private Integer actionId;

    private Integer permissionId;

    private String actionCode;

    private String defaultCheck;

    private String describes;
}
