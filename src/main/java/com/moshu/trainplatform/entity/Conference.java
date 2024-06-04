package com.moshu.trainplatform.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/22
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Conference implements Serializable {

    private static final long serialVersionUID = 5200400106498242085L;
    /**
     * 主键
     */
    private String id;
    /**
     * 会议名称
     */
    private String name;
    /**
     * 主持人
     */
    private String host;
    /**
     * 会议年份
     */
    private int year;
    /**
     * 备注
     */
    private String remark;
    /**
     * 附件模块
     */
    @TableField(exist = false)
    List<ModuleAttachment> moduleList;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;
    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime updateTime;


}
