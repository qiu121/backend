package com.moshu.trainplatform.constant.enumConstant;

public enum EmSwitchType {

    START("START", 0),
    CLOSE("CLOSE", 1)
    ;


    // 成员变量
    private final String name;
    private final int index;
    // 构造方法
    private EmSwitchType(String name, int index) {
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
