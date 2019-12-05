package com.se.controller;

import java.util.List;

import com.se.dao.pojo.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.dao.pojo.SysRole;
import com.se.service.SysRoleService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/system/")
public class SysRoleController {
	@Autowired
	private SysRoleService srs;

	//获取角色信息
	@RequestMapping("sysroleinfo")
	@ResponseBody
	public List<SysRole> getSysRoleInfo(){

		return srs.getSysRoleInfo();
	}

	//新增角色信息
	@RequestMapping("addrole")
	public String addRole(SysRole sr, HttpServletRequest request){
		SysRole sr1=srs.addRole(sr);
		if(sr1!=null){
			request.setAttribute("addrole_mess","添加角色成功");
		}else{
			request.setAttribute("addrole_mess","添加角色失败");
		}

		return "forward:../link/tosysrole";
	}

	//删除角色信息
	@RequestMapping("deleterole")
	@ResponseBody
	public int deleteRole(int rid){

		return srs.deleteRole(rid);
	}

	//获取角色下的人员信息列表
	@RequestMapping("getroleuser")
	@ResponseBody
	public List<SysUser> getRoleUser(int rid){
		return srs.getRoleUser(rid);
	}

	//修改角色信息
	@RequestMapping("updaterolename")
	@ResponseBody
	public boolean updateRoleName(SysRole sr){
		return srs.updateRoleName(sr);
	}

}
