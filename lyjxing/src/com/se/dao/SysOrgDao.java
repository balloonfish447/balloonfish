package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysOrganize;

public interface SysOrgDao {
	
	//获取组织结构
	public List<SysOrganize> getSysOrg(String oid);
	
	//????
	public SysOrganize addOrg(SysOrganize so);
	
	//???
	public SysOrganize updateOrg(SysOrganize so);
	
	//???
	public boolean deleteOrg(int oid, int ojigouid);
}
