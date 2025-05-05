package com.github.qiu121.library.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

@Data
public class Role implements Serializable {

    @TableId
    private Integer roleId;

    private String role;

    private String roleName;

}
