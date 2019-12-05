package com.se.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.SysRoleDao;
import com.se.dao.pojo.SysRole;
import com.se.service.SysRoleService;

@Service
public class SysRoleServiceImpl implements SysRoleService {
	@Autowired
	private SysRoleDao srd;

	@Override
	public List<SysRole> getSysRoleInfo(int oid) {
		return srd.getSysRoleInfo(oid);
	}

	@Override
	public SysRole addRole(SysRole sr) {
		return srd.addRole(sr);
	}

}
