package com.moshu.trainplatform.entity;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Notification {
    String id;

    @TableField(exist = false)
    String fromName;
    String fromId;

    @TableField(exist = false)
    String toName;
    String toId;

    String projectId;

    String content;
    String type;
    String status;

    @TableField(exist = false)
    String projectName;

    @TableField(exist = false)
    String projectCode;

    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private LocalDateTime updateTime;

}
