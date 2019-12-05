package com.se.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.LoginDao;
import com.se.dao.pojo.SysUser;
import com.se.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDao ld;

	public SysUser getLogin(SysUser su) {
		return ld.getLogin(su);
		
	}

}
