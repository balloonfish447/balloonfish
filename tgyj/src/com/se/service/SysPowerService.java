package com.se.service;

import java.util.List;

import com.se.dao.pojo.SysResource;
import com.se.dao.pojo.SysRole;
import com.se.vo.SysOrg;

public interface SysPowerService {
	

	public List<SysRole> getSysPowerRole();
	

	public boolean saveSysPower(int rid,Integer [] reids);
	
	public List<SysOrg> getSysResourceTree(int rid);

}
