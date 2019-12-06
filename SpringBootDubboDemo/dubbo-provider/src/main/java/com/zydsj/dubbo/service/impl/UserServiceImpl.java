package com.zydsj.dubbo.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.zydsj.dubbo.service.UserService;
import org.springframework.stereotype.Component;

@Component
@Service(version = "1.0.0",timeout = 10000,interfaceClass = UserService.class)
public class UserServiceImpl implements UserService {
    @Override
    public String sayHello() {
        return "来自dubbo-provider的实现";
    }

    @Override
    public Integer getId() {
        return 100;
    }
}
