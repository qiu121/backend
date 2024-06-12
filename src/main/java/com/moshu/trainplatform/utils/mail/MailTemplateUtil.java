package com.moshu.trainplatform.utils.mail;


import com.moshu.trainplatform.constant.Constant;
import com.moshu.trainplatform.dto.MailAlarmDTO;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public class MailTemplateUtil {

    /**
     * 系统报警
     * @return
     */
    public static String getAlarmTemplateEmail(MailAlarmDTO mailAlarmDTO) {
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy年MM月dd日");
        return "<p><strong>尊敬的 " + mailAlarmDTO.getName() + "：</strong></p>" +
                "<p>我们的" + Constant.SYSTEM_NAME + "监测到了以下问题，需要您的关注：</p>" +
                "<p><strong>报警类型：</strong>" + mailAlarmDTO.getType() + "</p>" +
                "<p><strong>报警级别：</strong> " + mailAlarmDTO.getGrade() + "</p>" +
                "<p><strong>报警详情：</strong></p>" +
                "<p>"+ mailAlarmDTO.getInfo() +"</p>" +
                "<p>请您尽快采取必要的行动，以确保系统稳定运行。</p>" +
                "<p>请勿回复此邮件。</p>" +
                "<p><span>上海素策信息科技有限公司</span></p>" +
                "<p>" + LocalDateTime.now().format(formatter1) +"</p>";
    }

}
