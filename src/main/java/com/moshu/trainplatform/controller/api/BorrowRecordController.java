package com.moshu.trainplatform.controller.api;

import com.moshu.trainplatform.service.IBorrowRecordService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
* @author to_Geek
* @date 2025/03/25
* @version 1.0
*/
@RestController
@RequestMapping("/api/borrow")
public class BorrowRecordController {

    @Resource
    private IBorrowRecordService borrowRecordService;



}
