package com.se.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.SysRoleDao;
import com.se.dao.pojo.SysRole;

@Repository
public class SysRoleDaoImpl implements SysRoleDao {
	@Autowired
	private SessionFactory sf;
	
	public Session getSession() {
		return sf.getCurrentSession();
	}

	@Override
	public List<SysRole> getSysRoleInfo(int oid) {
		String hqlString= "from SysRole where oid=?";
		Query query =getSession().createQuery(hqlString);
		query.setInteger(0, oid);
		List<SysRole> sysroles= query.list();
		return sysroles;
	}

	@Override
	public SysRole addRole(SysRole sr) {
		getSession().save(sr);
		return sr;
	}

}
