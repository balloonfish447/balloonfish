package com.zydsj.shiro.demoshiro.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @RequestMapping("/test01")
    public String test01(){
        return "123";
    }
}
