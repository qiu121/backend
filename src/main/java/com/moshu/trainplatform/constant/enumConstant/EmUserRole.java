package com.moshu.trainplatform.constant.enumConstant;

public enum EmUserRole {

    ADMIN("admin", 0),
    MAINTAIN("maintain", 1),
    USER("user", 2);

    // 成员变量
    private final String name;
    private final int index;
    // 构造方法
    private EmUserRole(String name, int index) {
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
