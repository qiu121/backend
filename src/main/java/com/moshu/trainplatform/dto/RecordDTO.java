package com.moshu.trainplatform.dto;

import com.moshu.trainplatform.vo.SoilSampleVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/05/30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecordDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    private Long id;

    private String username;
    private String userId;
    private List<SoilSampleVO> sampleList;


}
