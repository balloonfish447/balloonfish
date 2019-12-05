package com.se.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.SysUserDao;
import com.se.dao.pojo.SysUser;
import com.se.service.SysUserService;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

@Service
public class SysUserServiceImpl implements SysUserService{
	@Autowired
	private SysUserDao sod;

	@Override
	public List<SysOrg> getSysOrg(int ojigouid) {
		
		return sod.getSysOrg(ojigouid);
	}

	@Override
	public List<SysUserOut> getSysorguser(String bianma,String start,String length) {
		return sod.getSysorguser(bianma,start,length);
	}

	@Override
	public int getSysorgusercount(String bianma, String start, String length) {
		
		return sod.getSysorgusercount(bianma, start, length);
	}

	@Override
	public SysUser updateUser(SysUser sUser) {
		
		return sod.updateUser(sUser);
	}

	@Override
	public boolean deleteUser(int uid) {
		
		return sod.deleteUser(uid);
	}

	@Override
	public boolean addUser(SysUser sUser,String ipconfig) {
		
		return sod.addUser(sUser,ipconfig);
	}

}
