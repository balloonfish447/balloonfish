package com.se.dao.impl;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.RegisterDao;
import com.se.dao.pojo.SysUser;

@Repository
public class RegisterDaoImpl implements RegisterDao{

	@Autowired
	private SessionFactory sf;

	public Session getSession() {
		return sf.getCurrentSession();
	}

	@Override
	public boolean setRegister(SysUser su,String ipconfig) {

		su.setRegisterAddress(ipconfig);
		su.setRegisterTime(new Date());
		su.setLoginCount("0");
		su.setSigned("这家伙很懒，什么也没有留下");
		getSession().save(su);
		return true;
	}

}
