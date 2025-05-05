package com.github.qiu121.library.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookDTO {
    private Integer bookId;
    private String title;
    private String author;
    private String publisher;
    private LocalDate publishDate;
    private String category;
    private Integer stock;
}
