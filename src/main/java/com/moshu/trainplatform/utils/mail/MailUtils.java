package com.moshu.trainplatform.utils.mail;

import com.moshu.trainplatform.constant.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;

@Component
public class MailUtils {

    private static String from;

    @Value("${spring.mail.username}")
    public void setFrom(String from) {
        MailUtils.from = from;
    }

    private static JavaMailSender mailSender;

    @Autowired
    public void setJavaMailSender(JavaMailSender javaMailSender){
        MailUtils.mailSender = javaMailSender;
    }

    /**
     * 简单文本邮件
     * @param to 接收者邮件
     * @param subject 邮件主题
     * @param content 邮件内容
     */
    public static void sendSimpleMail(String to, String subject, String content){

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        message.setFrom(from);

        mailSender.send(message);
    }

    /**
     * HTML 文本邮件
     * @param to 接收者邮件
     * @param subject 邮件主题
     * @param content HTML内容
     * @throws MessagingException
     */
    public static void sendHtmlMail(String to, String subject, String content) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setTo(to);
        helper.setSubject(Constant.SYSTEM_NAME + "-" + subject);
        helper.setText(content, true);
        helper.setFrom(from);

        mailSender.send(message);
    }

    /**
     * 附件邮件
     * @param to 接收者邮件
     * @param subject 邮件主题
     * @param content HTML内容
     * @param filePath 附件路径
     * @throws MessagingException
     */
    public static void sendAttachmentsMail(String to, String subject, String content,
                                    String filePath) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(content, true);
        helper.setFrom(from);

        FileSystemResource file = new FileSystemResource(new File(filePath));
        String fileName = file.getFilename();
        helper.addAttachment(fileName, file);

        mailSender.send(message);
    }

    /**
     * 图片邮件
     * @param to 接收者邮件
     * @param subject 邮件主题
     * @param content HTML内容
     * @param rscPath 图片路径
     * @param rscId 图片ID
     * @throws MessagingException
     */
    public static void sendInlinkResourceMail(String to, String subject, String content,
                                       String rscPath, String rscId) {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = null;
        try {
            helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true);
            helper.setFrom(from);

            FileSystemResource res = new FileSystemResource(new File(rscPath));
            helper.addInline(rscId, res);
            mailSender.send(message);
            System.out.println("发送静态邮件成功！");
        } catch (MessagingException e) {
            System.out.println("发送静态邮件失败: ");
        }
    }
}
