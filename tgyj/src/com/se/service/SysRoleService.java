package com.se.service;

import java.util.List;

import com.se.dao.pojo.SysRole;
import com.se.dao.pojo.SysUser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public interface SysRoleService {
	

	public List<SysRole> getSysRoleInfo();
	

	public SysRole addRole(SysRole sr);

	//删除角色信息
	public  int deleteRole(int rid);

	//获取角色下的人员信息列表
	public List<SysUser> getRoleUser(int rid);

	//修改角色信息
	public boolean updateRoleName(SysRole sr);

}
