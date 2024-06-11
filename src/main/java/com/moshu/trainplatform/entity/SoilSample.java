package com.moshu.trainplatform.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 * 土壤样本表
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SoilSample implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 主键
     */
    private Long id;

    /**
     * 样本名称
     */
    private String sampleName;

    /**
     * 样本类型
     */
    private Long sampleTypeId;
    /**
     * 记录ID
     */
    private Long recordId;

    /**
     * 颜色
     */
    private String color;

    /**
     * 气味
     */
    private String smell;

    /**
     * 生物种类
     */
    private String organism;

    /**
     * 颗粒硬度
     */
    private String hardness;

    /**
     * 颗粒大小>2mm
     */
    private Double sizeGt2mm;

    /**
     * 颗粒大小<2mm
     */
    private Double sizeLt2mm;

    /**
     * 黏度
     */
    private String viscosity;

    /**
     * 湿度
     */
    private String humidity;

    /**
     * 紧实度
     */
    private String density;

    /**
     * 保水性
     */
    private String waterRetention;

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

}
