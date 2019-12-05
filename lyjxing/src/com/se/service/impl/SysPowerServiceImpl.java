package com.se.service.impl;

import java.util.List;

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
	public List<SysRole> getSysPowerRole(int oid) {
		
		return spd.getSysPowerRole(oid);
	}

	@Override
	public List<SysResource> getSysPower(int rid) {
		
		return spd.getSysPower(rid);
	}

	@Override
	public List<SysResource> getSysResource() {
		
		return spd.getSysResource();
	}

}
