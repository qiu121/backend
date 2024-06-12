package com.moshu.trainplatform.constant.enumConstant.alarm;

public enum EmAlarmType {

    /**
     * redis
     */
    REDIS("redis出现错误", "一级"),

    ;

    private final String name;

    private final String grade;

    private EmAlarmType(String name, String grade) {
        this.name = name;
        this.grade = grade;
    }

    public final String getGrade() {
        return this.grade;
    }

    public final  String getName() {
        return this.name;
    }

}
