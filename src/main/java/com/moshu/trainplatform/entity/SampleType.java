package com.moshu.trainplatform.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.moshu.trainplatform.dto.SampleTypeDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/06/03
 * 样本类型
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SampleType implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 类型名
     */
    private String sampleTypeName;

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

    public SampleType(SampleTypeDTO sampleTypeDTO){
        BeanUtils.copyProperties(sampleTypeDTO,this);
    }
}
