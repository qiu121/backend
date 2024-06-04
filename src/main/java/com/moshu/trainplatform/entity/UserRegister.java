package com.moshu.trainplatform.entity;


import lombok.Data;

@Data
public class UserRegister {
    String username;
    String password;
    String confirmPassword;
    String name;
    String email;
    String role;
}
