package com.github.qiu121.library.entity;


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
