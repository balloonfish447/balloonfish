package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysResource;
import com.se.dao.pojo.SysRole;

public interface SysPowerDao {
	//获取组织结构对应的角色信息
	public List<SysRole> getSysPowerRole(int oid);

	//根据角色信息获取角色的权限
	public List<SysResource> getSysPower(int rid);

	//获取资源列表进行授权
	public List<SysResource> getSysResource();

}
