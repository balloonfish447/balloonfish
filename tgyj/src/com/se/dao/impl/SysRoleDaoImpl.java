package com.se.dao.impl;

import java.util.List;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysUserOut;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
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
	//获取角色信息列表
	public List<SysRole> getSysRoleInfo() {
		//查询
		String hqlString= "SELECT sr.rid as rid,sr.rname as rname,sr.rbianma as rbianma,sr.oid as oid," +
				"( SELECT count( * ) FROM sys_user AS su WHERE su.roleid = sr.rid ) as ruser" +
				" FROM sys_role AS sr";
		Query query =getSession().createSQLQuery(hqlString).addEntity(SysRole.class);

		List<SysRole> sysroles= query.list();
		return sysroles;
	}

	@Override
	//新增角色信息
	public SysRole addRole(SysRole sr) {

		getSession().save(sr);
		return sr;
	}

	@Override
	//删除角色信息
	public int deleteRole(int rid) {
		//查询该角色下的用户信息
		String hql="select count(*) from SysUser where roleid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0,rid);
		Number num= (Number) query.uniqueResult();
		if(num.intValue()>0){
			return 1;
		}else{
			//如果不存在用户就删除该角色
			SysRole sr= (SysRole) getSession().get(SysRole.class,rid);
			getSession().delete(sr);
			return 0;
		}

	}

	//获取角色下的人员信息列表
	public List<SysUser> getRoleUser(int rid){
		String hql="from SysUser where roleid = "+rid;
		Query query=getSession().createQuery(hql);
		return query.list();
	}

	//修改角色信息
	public boolean updateRoleName(SysRole sr){
		getSession().update(sr);

		return true;
	}
}
