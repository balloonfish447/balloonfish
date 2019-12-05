package com.se.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.dao.pojo.SysRole;
import com.se.service.SysRoleService;

@Controller
@RequestMapping("/system/")
public class SysRoleController {
	@Autowired
	private SysRoleService srs;

	//获取组织结构下的角色信息
	@RequestMapping("sysroleinfo")
	@ResponseBody
	public List<SysRole> getSysRoleInfo(@RequestParam(value="oid") int oid){
		return srs.getSysRoleInfo(oid);
	}

	//新增角色信息
	@RequestMapping("addrole")
	@ResponseBody
	public SysRole addRole(SysRole sr){
		return srs.addRole(sr);
	}

}
