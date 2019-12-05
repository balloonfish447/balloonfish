package com.se.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/link")
public class LinkController {




	//用户登录
	@RequestMapping("/tologin")
	public String toLogin() {		
		return "login";
	}
	

	
	//用户管理
	@RequestMapping("/tosysuser")
	public String toSysUser() {

		return "sysuser";
	}
	
	//资源管理
	@RequestMapping("/tosysresource")
	public String toSysOrg() {		
		return "sysresource";
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

	//产品管理--入库管理
	@RequestMapping("/torukuguanli")
	public String toRuKuGuanLi() {
		return "rukuguanli";
	}

	//产品管理--出库管理记录
	@RequestMapping("/tochukuguanlijilu")
	public String toChuKuGuanLiJiLu() {
		return "chukuguanlijilu";
	}

	//产品管理--出库管理记录
	@RequestMapping("/tochukuguanli")
	public String toChuKuGuanLi() {
		return "chukuguanli";
	}
	

}
