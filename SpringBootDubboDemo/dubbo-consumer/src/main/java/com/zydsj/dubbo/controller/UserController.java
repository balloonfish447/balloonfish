package com.zydsj.dubbo.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.zydsj.dubbo.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @Reference(version = "1.0.0")
    private UserService userService;

    @GetMapping("/hello")
    public String sayHello(){
        return this.userService.sayHello();
    }


    @GetMapping("/getId")
    public String getId(){
        return this.userService.getId().toString();
    }


}
