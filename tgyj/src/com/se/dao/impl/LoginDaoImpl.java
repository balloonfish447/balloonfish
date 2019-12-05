package com.se.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.se.vo.SysOrg;
import com.se.vo.SysUserPowerOut;
import org.apache.catalina.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
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
		String hqlString="from SysUser where phone=? and password=?";
		Query query =getSession().createQuery(hqlString);
		query.setString(0, su.getPhone());
		query.setString(1, su.getPassword());

		SysUser sysUser= (SysUser) query.uniqueResult();

		return sysUser;
	}

	//获取用户权限
	public List<SysUserPowerOut> getSysUserPwoer(int rid){
		//获取用户权限
		String sql="SELECT " +
				"sr.resourcename as resourcename, " +
				"sr.relink as relink, " +
				"sr.rejigouid as rejigouid, " +
				"sr.reid as reid, "+
				"sr.reopjigouid as reopjigouid, "+
				"sr.rebianhao as rebianhao "+
				"FROM " +
				"sys_resource AS sr " +
				"WHERE " +
				"sr.reid IN ( SELECT sp.reid FROM sys_power AS sp WHERE sp.rid = :rid )";
		Query query=getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysUserPowerOut.class));
		query.setInteger("rid",rid);
		List<SysUserPowerOut> sups=query.list();

		return sups;
	}

}
