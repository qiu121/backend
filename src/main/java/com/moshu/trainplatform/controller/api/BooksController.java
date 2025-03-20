package com.moshu.trainplatform.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.moshu.trainplatform.dto.PageDTO;
import com.moshu.trainplatform.entity.Books;
import com.moshu.trainplatform.service.IBooksService;
import com.moshu.trainplatform.template.SuccessResponse;
import com.moshu.trainplatform.vo.RecordVO;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

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

}
