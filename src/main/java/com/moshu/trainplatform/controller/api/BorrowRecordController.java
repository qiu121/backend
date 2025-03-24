package com.moshu.trainplatform.controller.api;

import com.moshu.trainplatform.dto.BorrowDTO;
import com.moshu.trainplatform.entity.BorrowRecord;
import com.moshu.trainplatform.service.IBorrowRecordService;
import com.moshu.trainplatform.template.SuccessResponse;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;

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

    @PostMapping("/borrowBooks")
    @RequiresRoles(value = {"admin", "user"}, logical = Logical.OR)
    public SuccessResponse listBooks(@RequestBody BorrowDTO borrowDTO) {

        BorrowRecord borrowRecord = new BorrowRecord().builder()
                .bookId(borrowDTO.getBookId())
                .borrowTime(borrowDTO.getBorrowTime())
                .expectReturnTime(borrowDTO.getExpectReturnTime())
                .userId(borrowDTO.getUserId())
                .build();
        boolean save = borrowRecordService.save(borrowRecord);
        SuccessResponse response = new SuccessResponse(200);
        HashMap<String, Object> map = new HashMap<>();
        map.put("success", save);
        response.setData(map);
        return response;
    }




}
