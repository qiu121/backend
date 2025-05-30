package com.github.qiu121.library.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.qiu121.library.dto.PageDTO;
import com.github.qiu121.library.entity.Books;
import com.github.qiu121.library.entity.BorrowRecord;
import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.service.IBooksService;
import com.github.qiu121.library.service.IBorrowRecordService;
import com.github.qiu121.library.service.UserInfoService;
import com.github.qiu121.library.template.SuccessResponse;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
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

    /**
     * 归还图书
     *
     * @param userId         用户ID
     * @param borrowRecordId 借阅记录ID
     * @return
     */
    @PutMapping("/updateBorrowRecord")
    @RequiresRoles("user")
    @ResponseBody
    public SuccessResponse updateBorrowRecord(String userId, String borrowRecordId) {
        SuccessResponse response = new SuccessResponse(200);
        BorrowRecord borrowRecord = borrowRecordService.getOne(new LambdaQueryWrapper<BorrowRecord>()
                .eq(BorrowRecord::getUserId, userId)
                .eq(BorrowRecord::getBorrowRecordId, borrowRecordId));
        if (borrowRecord == null) {
            response.setMsg("数据不存在");
            response.setCode(400);
            return response;
        }
        // 当前时间和预计归还时间比较
        LocalDateTime now = LocalDateTime.now();
        if (now.isAfter(borrowRecord.getExpectReturnTime().atStartOfDay())) {
            // 逾期归还
            borrowRecord.setStatus(Byte.valueOf("3"));
        } else {
            // 正常归还
            borrowRecord.setStatus(Byte.valueOf("2"));
        }
        borrowRecord.setActualReturnTime(now);
        borrowRecordService.updateById(borrowRecord);
        // 修改图书库存
        Books books = booksService.getOne(new LambdaQueryWrapper<Books>()
                .eq(Books::getBookId, borrowRecord.getBookId()));
        if (books == null) {
            response.setMsg("图书不存在");
            response.setCode(400);
            return response;
        }
        books.setStock(books.getStock() + 1);
        books.setUpdateTime(LocalDateTime.now());
        booksService.updateById(books);
        response.setMsg("归还成功");
        return response;
    }

    /**
     * 删除借阅记录
     *
     * @param borrowRecordId 借阅记录ID
     * @return
     */
    @DeleteMapping("/removeBorrowRecord")
    @RequiresRoles("admin")
    public SuccessResponse removeBorrowRecord(Integer borrowRecordId) {
        SuccessResponse response = new SuccessResponse(200);
        response.setMsg("删除成功");

        boolean success = borrowRecordService.removeById(borrowRecordId);
        HashMap<String, Object> map = new HashMap<>();
        map.put("success", success);
        if (!success) {
            response.setMsg("删除失败");
            response.setCode(0);
        }
        response.setData(map);
        return response;

    }

    /**
     * 批量删除借阅记录
     *
     * @param borrowRecordIdList 借阅记录ID列表
     * @return
     */
    @DeleteMapping("/batchRemoveBorrowRecord")
    @RequiresRoles("admin")
    public SuccessResponse batchRemoveBorrowRecord(@RequestBody List<Integer> borrowRecordIdList) {
        SuccessResponse response = new SuccessResponse(200);
        response.setMsg("删除成功");

        boolean success = borrowRecordService.removeByIds(borrowRecordIdList);
        HashMap<String, Object> map = new HashMap<>();
        map.put("success", success);
        if (!success) {
            response.setMsg("删除失败");
            response.setCode(0);
        }
        response.setData(map);
        return response;
    }

}
