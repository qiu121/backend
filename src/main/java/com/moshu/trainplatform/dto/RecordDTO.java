package com.moshu.trainplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecordDTO {

    /**
     * 主键，更新使用
     */
    private Long id;
    /**
     * 用户id
     */
    private String userId;
    /**
     * 实验记录名称
     */
    private String recordName;

}
