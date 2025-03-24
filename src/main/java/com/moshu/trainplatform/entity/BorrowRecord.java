package com.moshu.trainplatform.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Builder;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
* @author to_Geek
* @date 2025/03/25
* @version 1.0
*/
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("`borrow_record`")
@Builder
public class BorrowRecord implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 借阅用户ID
     */
    private String userId;

    /**
     * 图书ID
     */
    private Long bookId;

    /**
     * 借阅时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate borrowTime;

    /**
     * 应归还时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate expectReturnTime;

    /**
     * 实际归还时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime actualReturnTime;

    /**
     * 借阅状态(1:进行中 2:已归还 3:逾期)
     */
    private Byte status;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;

    /**
     * 删除标记(0:正常 1:删除)
     */
    private Boolean isDeleted;
}