package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.moshu.trainplatform.dto.PageDTO;
import com.moshu.trainplatform.entity.Books;
import com.moshu.trainplatform.entity.BorrowRecord;
import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.service.IBooksService;
import com.moshu.trainplatform.service.IBorrowRecordService;
import com.moshu.trainplatform.service.UserInfoService;
import com.moshu.trainplatform.template.SuccessResponse;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.awt.print.Book;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author to_Geek
 * @version 1.0
 * @date 2025/03/25
 */
@RestController
@RequestMapping("/api/borrow")
public class BorrowRecordController {

    @Resource
    private IBorrowRecordService borrowRecordService;
    @Resource
    private IBooksService booksService;

    @Resource
    private UserInfoService userService;

    @PostMapping("/getBorrowRecord")
    @RequiresRoles("user")
    public SuccessResponse getBorrowRecord(String userId) {
        SuccessResponse response = new SuccessResponse(200);
        List<BorrowRecord> list = borrowRecordService.list(new LambdaQueryWrapper<BorrowRecord>()
                .eq(BorrowRecord::getUserId, userId));
        list = list.stream().peek(record -> {
            Books books = booksService.getOne(new LambdaQueryWrapper<Books>()
                    .eq(Books::getBookId, record.getBookId()));
            record.setBookName(books.getTitle());
        }).collect(Collectors.toList());

        HashMap<String, Object> map = new HashMap<>();
        map.put("result", list);
        response.setData(map);
        return response;
    }

    @PostMapping("/listBorrowRecord")
    @RequiresRoles("admin")
    public SuccessResponse listBorrowRecord(@RequestBody PageDTO pageDTO) {

        Page<BorrowRecord> page = new Page<>(pageDTO.getCurrentPage(), pageDTO.getPageSize());
        LambdaQueryWrapper<BorrowRecord> wrapper = new LambdaQueryWrapper<>();
        page = borrowRecordService.page(page, wrapper);

        List<BorrowRecord> borrowRecordList = page.getRecords().stream().peek(borrowRecord -> {
            // 查询出图书名
            Books books = booksService.getOne(new LambdaQueryWrapper<Books>()
                    .eq(Books::getBookId, borrowRecord.getBookId()));
            borrowRecord.setBookName(books.getTitle());

            // 查询出用户名
            UserInfo user = userService.getById(borrowRecord.getUserId());
            borrowRecord.setUserName(user.getUserName());

        }).collect(Collectors.toList());


        SuccessResponse response = new SuccessResponse(200);
        HashMap<String, Object> map = new HashMap<>();
        map.put("result", page);
        response.setData(map);
        return response;
    }

}
