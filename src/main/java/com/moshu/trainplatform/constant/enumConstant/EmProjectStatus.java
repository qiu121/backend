package com.moshu.trainplatform.constant.enumConstant;

public enum EmProjectStatus {

    Declaration("declaration", 0),
    Approval("approval", 1),
    Conclusion("conclusion", 2),
    Assessment("assessment", 3),
    End("end", 4),

    ;


    // 成员变量
    private final String name;
    private final int index;
    // 构造方法
    private EmProjectStatus(String name, int index) {
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
