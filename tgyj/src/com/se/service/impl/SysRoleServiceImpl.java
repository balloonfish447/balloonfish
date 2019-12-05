package com.se.service.impl;

import java.util.List;

import com.se.dao.pojo.SysUser;
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
	public List<SysRole> getSysRoleInfo() {
		return srd.getSysRoleInfo();
	}

	@Override
	public SysRole addRole(SysRole sr) {
		return srd.addRole(sr);
	}

	@Override
	//删除角色信息
	public int deleteRole(int rid) {
		return srd.deleteRole(rid);
	}

	//获取角色下的人员信息列表
	public List<SysUser> getRoleUser(int rid){
		return srd.getRoleUser(rid);
	}

	//修改角色信息
	public boolean updateRoleName(SysRole sr){
		return srd.updateRoleName(sr);
	}

}
