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
	//评论管理
	@RequestMapping("/topinglun")
	public String topinglun(){
		return "pinglun";
	}
	//私信管理
	@RequestMapping("/tosixin")
	public String tosixin(){
		return "sixin";
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

	@RequestMapping("/tosysteam")
	public String toSysTeam(){return "systeam";}

	//已加入的社团
	@RequestMapping("/torukuguanli")
	public String toRuKuGuanLi() {
		return "rukuguanli";
	}

	//社团一览
	@RequestMapping("/tochukuguanlijilu")
	public String toChuKuGuanLiJiLu() {
		return "chukuguanlijilu";
	}

	//我管理的社团
	@RequestMapping("/tochukuguanli")
	public String toChuKuGuanLi() {
		return "chukuguanli";
	}
   //入社申请
	@RequestMapping("/toteamshenqing")
	public String toTeamShengqing(){return "teamshenqing";}
	

}
