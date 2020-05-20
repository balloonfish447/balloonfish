package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysResource;
import com.se.dao.pojo.SysRole;
import com.se.vo.SysOrg;

public interface SysPowerDao {
	//获取组织结构对应的角色信息
	public List<SysRole> getSysPowerRole();

	//保存角色选择的权限
	public boolean saveSysPower(int rid,Integer [] reids);

	//根据角色构建资源列表tree
	public List<SysOrg> getSysResourceTree(int rid);

}
