package com.se.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.LoginDao;
import com.se.dao.pojo.SysUser;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SessionFactory sf;

	//获取Hibernate中的session
	public Session getSession() {
		return sf.openSession();
	}

	@Override
	public SysUser getLogin(SysUser su) {
		String hqlString="from SysUser where email=? and password=?";
		Query query =getSession().createQuery(hqlString);
		query.setString(0, su.getEmail());
		query.setString(1, su.getPassword());

		SysUser sysUser= (SysUser) query.uniqueResult();

		return sysUser;
	}

}
