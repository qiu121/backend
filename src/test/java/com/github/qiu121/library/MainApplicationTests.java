package com.github.qiu121.library;

import com.github.qiu121.library.entity.UserInfo;
import com.github.qiu121.library.service.UserInfoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.DigestUtils;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class MainApplicationTests {

    @Autowired
    private UserInfoService userInfoService;

    /**
     * 更新密码
     */
    @Test
    public void updatePassWord() {
        UserInfo userInfo = userInfoService.getUserByUsername("admin");
        // String newPassWord = "25d55ad283aa400af464c76d713c07ad"; // 前端 md5 加密

        String password = "admin";
        String md5Pass = DigestUtils.md5DigestAsHex(password.getBytes());
        System.out.println("md5Pass = " + md5Pass);
        // 21232f297a57a5a743894a0e4a801fc3
        userInfoService.resetPassWord(userInfo, md5Pass);
    }

}
