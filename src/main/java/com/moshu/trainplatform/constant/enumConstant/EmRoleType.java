package com.moshu.trainplatform.constant.enumConstant;

public enum EmRoleType {
    ADMIN("admin", 0),
    MAINTAIN("maintain", 1),
    USER("user", 2)
    ;

    // 成员变量
    private final String name;

    private final int index;
    // 构造方法
    private EmRoleType(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public final int getIndex() {
        return this.index;
    }

    public String toString() {
        return this.name;
    }

}
