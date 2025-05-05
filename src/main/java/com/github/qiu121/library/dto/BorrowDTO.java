package com.github.qiu121.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * @author Leo
 * @version 1.0
 * @date 2025/03/25
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BorrowDTO {

    private String userId;
    private Long bookId;
    private LocalDate borrowTime;
    private LocalDate expectReturnTime;
    private LocalDate returnTime;
}
