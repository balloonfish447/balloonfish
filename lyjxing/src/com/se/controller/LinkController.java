package com.se.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/link")
public class LinkController {
	@Autowired


	//用户登录
	@RequestMapping("/tologin")
	public String toLogin() {		
		return "login";
	}
	
	//用户注册
	@RequestMapping("/toregister")
	public String toRegister() {		
		return "register";
	}
	
	//用户管理
	@RequestMapping("/tosysuser")
	public String toSysUser() {		
		return "sysuser";
	}
	
	//组织结构管理
	@RequestMapping("/tosysorg")
	public String toSysOrg() {		
		return "sysorg";
	}
	
	//权限管理
	@RequestMapping("/tosyspower")
	public String toSysPower() {		
		return "syspower";
	}
	
	//角色管理
	@RequestMapping("/tosysrole")
	public String toSysRole() {		
		return "sysrole";
	}
	

}
