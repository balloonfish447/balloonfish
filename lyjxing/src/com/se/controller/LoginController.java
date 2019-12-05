package com.se.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.dao.pojo.SysUser;
import com.se.service.LoginService;

@Controller
@RequestMapping()
public class LoginController {
	@Autowired
	private LoginService ls;
	
	@RequestMapping("/login")
	public String getLogin(SysUser su,HttpServletRequest request) {
		SysUser sysUser=ls.getLogin(su);
		//获取session
		HttpSession session = request.getSession();
		if(sysUser!=null) {
			session.setAttribute("USERINFO", sysUser);
			return "redirect:systementry/jsp/index.jsp";
		}else {
			request.setAttribute("errorlogin","用户名或者密码错误");
			return "forward:systementry/jsp/login.jsp";
		}
	}
	
	

}
