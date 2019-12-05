package com.se.service.impl;


import com.se.vo.SysUserPowerOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.LoginDao;
import com.se.dao.pojo.SysUser;
import com.se.service.LoginService;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDao ld;

	public SysUser getLogin(SysUser su) {
		return ld.getLogin(su);
		
	}

	//获取用户权限
	public List<SysUserPowerOut> getSysUserPwoer(int rid){
		return ld.getSysUserPwoer(rid);
	}

}
