package com.se.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.SysPowerDao;
import com.se.dao.pojo.SysResource;
import com.se.dao.pojo.SysRole;

@Repository
public class SysPowerDaoImpl implements SysPowerDao {
	@Autowired
	private SessionFactory sf;
	
	public Session getSession() {
		return sf.getCurrentSession();
	}

	@Override
	public List<SysRole> getSysPowerRole(int oid) {
		String hqlString="from SysRole where oid=?";
		Query query = getSession().createQuery(hqlString);
		query.setInteger(0, oid);
		return query.list();
		
		
	}

	@Override
	public List<SysResource> getSysPower(int rid) {
		String sqlString="SELECT * from sys_resource where reid in (select reid from sys_rero where roid=?)";
		Query query = getSession().createSQLQuery(sqlString).addEntity(SysResource.class);
		query.setInteger(0, rid);
		List<SysResource> srList=query.list();
		return srList;
	}

	@Override
	public List<SysResource> getSysResource() {
		String hqlString="from SysResource";
		Query query =getSession().createQuery(hqlString);
		List<SysResource> srsList = query.list();
		return srsList;
	}

}
