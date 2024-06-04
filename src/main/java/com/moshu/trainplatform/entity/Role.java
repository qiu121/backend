package com.moshu.trainplatform.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

@Data
public class Role implements Serializable {

    @TableId
    private Integer roleId;
    /**
     * 用户角色
     */
    private String role;
    /**
     * 用户角色中文名
     */
    private String roleName;

}
