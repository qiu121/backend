package com.moshu.trainplatform;

import com.moshu.trainplatform.constant.enumConstant.alarm.EmAlarmModule;
import com.moshu.trainplatform.dto.MailAlarmDTO;
import com.moshu.trainplatform.entity.AlarmInfo;
import com.moshu.trainplatform.entity.UserInfo;
import com.moshu.trainplatform.service.AlarmInfoService;
import com.moshu.trainplatform.service.UserInfoService;
import com.moshu.trainplatform.utils.mail.MailTemplateUtil;
import com.moshu.trainplatform.utils.mail.MailUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.DigestUtils;

import javax.mail.MessagingException;
import java.util.List;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class MainApplicationTests {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private AlarmInfoService alarmInfoService;

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

    /**
     * 测试邮件发送
     */
    @Test
    public void testMail() {
        try {
            List<AlarmInfo> alarmInfos = alarmInfoService.getAllAlarmInfoByModule(EmAlarmModule.ALL.toString());
            for (AlarmInfo alarmInfo : alarmInfos) {
                MailAlarmDTO mailAlarmDTO = new MailAlarmDTO();
                mailAlarmDTO.setName(alarmInfo.getName());
                mailAlarmDTO.setType("测试类型");
                mailAlarmDTO.setGrade("一级");
                mailAlarmDTO.setInfo("测试信息");
                MailUtils.sendHtmlMail("503297590@qq.com", "系统报警通知", MailTemplateUtil.getAlarmTemplateEmail(mailAlarmDTO));
            }
        } catch (MessagingException m) {
            m.printStackTrace();
            ;
        }

    }

}
