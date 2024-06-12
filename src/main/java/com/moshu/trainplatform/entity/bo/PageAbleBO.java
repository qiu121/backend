package com.moshu.trainplatform.entity.bo;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

@Data
public class PageAbleBO {

    @TableField(exist = false)
    private Integer currentPage;

    @TableField(exist = false)
    private Integer pageSize;

    @TableField(exist = false)
    private Boolean isAll;

}
