package com.github.qiu121.library.dto;

import lombok.Data;

/**
 * @author Leo
 * @version 1.0
 * @date 2024/06/11
 */
@Data
public class PageDTO {
    /**
     * 当前页码
     */
    private Integer currentPage;
    /**
     * 每页条数
     */
    private Integer pageSize;
}
