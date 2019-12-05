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
	public List<SysUserOut> getSysorguser(String start,String length) {
		return sod.getSysorguser(start,length);
	}

	@Override
	public int getSysorgusercount( String start, String length) {
		
		return sod.getSysorgusercount(start, length);
	}

	@Override
	public SysUserOut updateUser(SysUser sUser) {
		
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

	//批量删除用户信息
	@Override
	public boolean deleteBatchOrgUser(List<Integer> uidList) {
		return sod.deleteBatchOrgUser(uidList);

	}
	//验证手机号是否存在
	@Override
	public boolean checkPhone(String checkphone,String flag){
		return  sod.checkPhone(checkphone,flag);
	}
}
