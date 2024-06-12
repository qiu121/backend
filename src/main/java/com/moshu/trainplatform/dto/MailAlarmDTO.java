package com.moshu.trainplatform.dto;


import lombok.Data;

/**
 * 邮件
 * 系统报警
 */
@Data
public class MailAlarmDTO {

    /**
     * 员工名称
     */
    private String name;

    /**
     * 报警类型
     */
    private String type;

    /**
     * 报警等级
     */
    private String grade;

    /**
     * 报警信息
     */
    private String info;

}
