package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.moshu.trainplatform.dto.BorrowDTO;
import com.moshu.trainplatform.dto.PageDTO;
import com.moshu.trainplatform.entity.Books;
import com.moshu.trainplatform.entity.BorrowRecord;
import com.moshu.trainplatform.service.IBooksService;
import com.moshu.trainplatform.service.IBorrowRecordService;
import com.moshu.trainplatform.template.SuccessResponse;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;

/**
* @author to_Geek
* @date 2025/03/18
* @version 1.0
*/
@RestController
@RequestMapping("/api/books")
public class BooksController {

    @Resource
    private IBooksService booksService;
    @Resource
    private IBorrowRecordService borrowRecordService;


    @PostMapping("/listBooks")
    @RequiresRoles(value = {"admin", "user"}, logical = Logical.OR)
    public SuccessResponse listBooks(@RequestBody PageDTO pageDTO) {
        Integer currentPage = pageDTO.getCurrentPage();
        Integer pageSize = pageDTO.getPageSize();

        LambdaQueryWrapper<Books> wrapper = new LambdaQueryWrapper<>();
        Page<Books> page = booksService.page(new Page<>(currentPage, pageSize),wrapper);
        HashMap<String, Object> map = new HashMap<>();
        map.put("result", page);
        SuccessResponse response = new SuccessResponse(200);
        response.setData(map);
        return response;
    }


    @PostMapping("/borrowBooks")
    @RequiresRoles("user")
    public SuccessResponse borrowBooks(@RequestBody BorrowDTO borrowDTO) {


        SuccessResponse response = new SuccessResponse(200);

        Books books = booksService.getOne(new LambdaQueryWrapper<Books>()
                .eq(Books::getBookId, borrowDTO.getBookId()));
        if (books == null) {
            response.setMsg("数据不存在");
        }
        assert books != null;
        if(books.getStock() <= 0 ){
            response.setMsg("当前数据库存不足");
        }

        BorrowRecord borrowRecord = BorrowRecord.builder()
                .bookId(borrowDTO.getBookId())
                .userId(borrowDTO.getUserId())
                .borrowTime(borrowDTO.getBorrowTime())
                .expectReturnTime(borrowDTO.getExpectReturnTime())
                .build();

        // 记录图书借阅信息、更新图书库存，两个操作应该为原子操作
        boolean save = borrowRecordService.save(borrowRecord);
        books.setStock(books.getStock() - 1);
        boolean update = booksService.updateById(books);

        HashMap<String, Object> map = new HashMap<>();
        map.put("success", save && update);
        response.setData(map);
        return response;
    }

}
