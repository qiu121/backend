package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.moshu.trainplatform.dto.BookDTO;
import com.moshu.trainplatform.dto.BorrowDTO;
import com.moshu.trainplatform.dto.PageDTO;
import com.moshu.trainplatform.entity.Books;
import com.moshu.trainplatform.entity.BorrowRecord;
import com.moshu.trainplatform.service.IBooksService;
import com.moshu.trainplatform.service.IBorrowRecordService;
import com.moshu.trainplatform.template.SuccessResponse;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author to_Geek
 * @version 1.0
 * @date 2025/03/18
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
        wrapper.orderByDesc(Books::getCreateTime)
                .orderByDesc(Books::getUpdateTime); // 链式调用
        Page<Books> page = booksService.page(new Page<>(currentPage, pageSize), wrapper);
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
        if (books.getStock() <= 0) {
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

    /**
     * 删除图书信息
     *
     * @param bookId 图书ID
     * @return
     */
    @DeleteMapping("/deleteBook")
    @RequiresRoles("admin")
    public SuccessResponse deleteBook(Integer bookId) {
        SuccessResponse response = new SuccessResponse(200);
        response.setMsg("删除成功");
        List<BorrowRecord> list = borrowRecordService.list(
                new LambdaQueryWrapper<BorrowRecord>()
                        .eq(BorrowRecord::getBookId, bookId));
        if (CollectionUtils.isNotEmpty(list)) {
            response.setCode(2);
            response.setMsg("图书已被借阅，不允许删除");
            return response;
        }
        boolean delete = booksService.removeById(bookId);
        HashMap<String, Object> map = new HashMap<>();
        map.put("success", delete);
        response.setData(map);
        return response;

    }

    /**
     * 批量删除图书信息
     *
     * @param bookIdList 图书ID列表
     * @return
     */
    @DeleteMapping("/batchDeleteBooks")
    @RequiresRoles("admin")
    public SuccessResponse batchDeleteBooks(@RequestBody List<Integer> bookIdList) {
        SuccessResponse response = new SuccessResponse(200);
        response.setMsg("删除成功");
        List<BorrowRecord> list = borrowRecordService.list(
                new LambdaQueryWrapper<BorrowRecord>()
                        .in(BorrowRecord::getBookId, bookIdList));
        if (CollectionUtils.isNotEmpty(list)) {
            //找到ID列表
            List<Long> problemBookIDList = list.stream().map(BorrowRecord::getBookId).collect(Collectors.toList());
            List<Books> problemBookList = booksService.list(new LambdaQueryWrapper<Books>()
                    .in(Books::getBookId, problemBookIDList));
            //将list中的`title`,`author`,`publisher`字段提取出来，组成一个字符串，用逗号分隔
            StringBuilder stringBuilder = new StringBuilder();
            Books book = problemBookList.get(0);
            stringBuilder.append("【");
            stringBuilder.append(book.getTitle()).append("-");
            stringBuilder.append(book.getAuthor()).append("-");
            stringBuilder.append(book.getPublisher());
            stringBuilder.append("】");
            response.setCode(2);
            response.setMsg("存在图书" + stringBuilder + "已被借阅，不允许删除");
            return response;
        }
        boolean delete = booksService.removeByIds(bookIdList);
        HashMap<String, Object> map = new HashMap<>();
        map.put("success", delete);
        response.setData(map);
        return response;
    }

    /**
     * 更新图书信息
     *
     * @param bookDTO 图书信息
     * @return
     */
    @PutMapping("/updateBook")
    @RequiresRoles("admin")
    public SuccessResponse updateBook(@RequestBody BookDTO bookDTO) {
        SuccessResponse response = new SuccessResponse(200);
        Books book = booksService.getOne(new LambdaQueryWrapper<Books>()
                .eq(Books::getTitle, bookDTO.getTitle())
                .eq(Books::getAuthor, bookDTO.getAuthor())
                .eq(Books::getPublisher, bookDTO.getPublisher())
                .ne(Books::getBookId, bookDTO.getBookId()));
        if (book != null) {
            response.setCode(2);
            response.setMsg("图书已存在");
            return response;
        }
        Books books = new Books();
        BeanUtils.copyProperties(bookDTO, books);
        boolean update = booksService.updateById(books);
        HashMap<String, Object> map = new HashMap<>();
        map.put("success", update);
        response.setData(map);
        return response;
    }

    /**
     * 添加图书信息
     *
     * @param bookDTO 图书信息
     * @return
     */
    @PostMapping("/addBook")
    @RequiresRoles("admin")
    public SuccessResponse addBook(@RequestBody BookDTO bookDTO) {
        SuccessResponse response = new SuccessResponse(200);
        if (bookDTO.getStock() <= 0) {
            response.setCode(2);
            response.setMsg("库存不能小于0");
            return response;
        }
        Books book = booksService.getOne(new LambdaQueryWrapper<Books>()
                .eq(Books::getTitle, bookDTO.getTitle())
                .eq(Books::getAuthor, bookDTO.getAuthor())
                .eq(Books::getPublisher, bookDTO.getPublisher()));
        if (book != null) {
            response.setCode(2);
            response.setMsg("图书已存在");
            return response;
        }
        Books books = new Books();
        BeanUtils.copyProperties(bookDTO, books);
        boolean save = booksService.save(books);
        HashMap<String, Object> map = new HashMap<>();
        map.put("success", save);
        response.setData(map);
        return response;
    }
}
