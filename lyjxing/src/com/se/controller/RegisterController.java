package com.se.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.dao.pojo.SysUser;
import com.se.service.RegisterService;
import com.se.util.GetIpConfig;

@Controller
public class RegisterController {
	@Autowired
	private RegisterService rs;
	
	
	@RequestMapping("/register")
	public String setRegister(SysUser su,HttpServletRequest request) {
		//获取用户ip地址
		String ipconfig=GetIpConfig.getIpAddr(request);
		boolean b = rs.setRegister(su,ipconfig);
		if(b) {
			return "login";
		}else {
			return "register";
		}
	}

}
