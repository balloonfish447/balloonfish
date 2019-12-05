package com.se.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.RegisterDao;
import com.se.dao.pojo.SysUser;
import com.se.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService{
	@Autowired
	private RegisterDao rd;
	

	@Override
	public boolean setRegister(SysUser su,String ipconfig) {
		return rd.setRegister(su,ipconfig);
		
	}

}
