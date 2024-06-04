package com.moshu.trainplatform.vo;

import com.moshu.trainplatform.entity.SoilSample;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SoilSampleVO implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;

    /**
     * 样本名称
     */
    private String sampleName;

    /**
     * 样本类型
     */
    private String sampleType;
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
     * 生物种类(植物根系)
     */
    private String origanism;

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
    private String watRetention;

    public SoilSampleVO(SoilSample soilSample) {
        BeanUtils.copyProperties(soilSample, this);
    }

}
