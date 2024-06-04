package com.moshu.trainplatform.constant.enumConstant;

public enum EmNotificationStatus {

    UNREAD("unread", 0),
    READ("read", 1),
    ;


    // 成员变量
    private final String name;
    private final int index;
    // 构造方法
    private EmNotificationStatus(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public final int getIndex() {
        return this.index;
    }
    // 覆盖方法
    @Override
    public String toString() {
        return this.name;
    }
}
