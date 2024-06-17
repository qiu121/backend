package com.moshu.trainplatform.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.moshu.trainplatform.dto.RecordDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 * 实验记录表
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Record implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 记录ID
     */
    private String userId;
    /**
     * 数据状态(草稿、未提交、已提交)
     */
    private String status;
    /**
     * 实验记录名称
     */
    private String recordName;
    /**
     * 提交时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime submitTime;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime updateTime;

    /**
     * 是否删除(0-未删, 1-已删)
     */
    private Integer isDeleted;

    public Record(RecordDTO recordDTO) {
        BeanUtils.copyProperties(recordDTO, this);
    }

}

