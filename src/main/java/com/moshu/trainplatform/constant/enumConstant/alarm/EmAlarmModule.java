package com.moshu.trainplatform.constant.enumConstant.alarm;

public enum EmAlarmModule {

    /**
     * 所有
     */
    ALL("ALL"),

    /**
     * 用户相关模块
     */
    USER("USER")
    ;

    private final String name;
    private EmAlarmModule(String name) {
        this.name = name;
    }
    @Override
    public String toString() {
        return this.name;
    }
}
