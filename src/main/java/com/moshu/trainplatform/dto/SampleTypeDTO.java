package com.moshu.trainplatform.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/06/03
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SampleTypeDTO implements Serializable {
    private Long id;
    /**
     * 样本类型名
     */
    private String sampleTypeName;

}
