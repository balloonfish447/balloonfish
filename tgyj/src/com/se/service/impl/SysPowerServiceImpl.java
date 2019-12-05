package com.se.service.impl;

import java.util.List;

import com.se.vo.SysOrg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.SysPowerDao;
import com.se.dao.pojo.SysResource;
import com.se.dao.pojo.SysRole;
import com.se.service.SysPowerService;

@Service
public class SysPowerServiceImpl implements SysPowerService {
	@Autowired
	private SysPowerDao spd;

	@Override
	public List<SysRole> getSysPowerRole() {
		
		return spd.getSysPowerRole();
	}

	@Override
	public boolean saveSysPower(int rid,Integer [] reids) {
		
		return spd.saveSysPower(rid,reids);
	}

	@Override
	public List<SysOrg> getSysResourceTree(int rid) {
		
		return spd.getSysResourceTree(rid);
	}

}
