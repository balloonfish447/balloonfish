package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysRole;
import com.se.dao.pojo.SysUser;

public interface SysRoleDao {
	
	//查询组织结构下的角色信息
	public List<SysRole> getSysRoleInfo();
	
	
	//新增
	public SysRole addRole(SysRole sr);

	//删除角色信息
	public  int deleteRole(int rid);

	//获取角色下的人员信息列表
	public List<SysUser> getRoleUser(int rid);

	//修改角色信息
	public boolean updateRoleName(SysRole sr);

}
