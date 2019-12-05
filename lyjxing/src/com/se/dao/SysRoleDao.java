package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysRole;

public interface SysRoleDao {
	
	//查询组织结构下的角色信息
	public List<SysRole> getSysRoleInfo(int oid);
	
	
	//新增
	public SysRole addRole(SysRole sr);

}
