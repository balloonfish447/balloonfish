package com.se.dao.impl;

import java.util.List;

import com.se.dao.pojo.SysResource;
import com.se.vo.SysResourceOut;
import com.se.vo.SysUserOut;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.SysResourceDao;
import com.se.dao.pojo.SysOrganize;

@Repository
public class SysResourceDaoImpl implements SysResourceDao {
	@Autowired
	private SessionFactory sf;

	public Session getSession() {
		return sf.getCurrentSession();
	}

	@Override
	//获取资源列表详情
	public List<SysResourceOut> getSysResource() {
		String sql="SELECT " +
                "lsre.*, " +
                "rsre.resourcename AS fucaidan, " +
                "sre.resourcename AS zicaidan " +
                "FROM sys_resource AS sre  " +
                "RIGHT JOIN sys_resource AS rsre  " +
                "ON sre.reid = rsre.reopjigouid  " +
                "right JOIN sys_resource AS lsre " +
                "ON lsre.reopjigouid = rsre.reid";
		Query query = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysResourceOut.class));
		List<SysResourceOut> srList=query.list();
		return srList;
	}

	@Override
	//新增
	public SysResource addResource(SysResource sr) {

		getSession().save(sr);
		return sr;
	}

	@Override
	//修改
	public SysResource updateResource(SysResource sr) {

		getSession().update(sr);
		getSession().flush();
		return sr;
	}

	@Override
    //删除资源信息
	public boolean deleteResource(int reid) {
		SysResource sysResource=(SysResource) getSession().get(SysResource.class, reid);
		getSession().delete(sysResource);

		return true;
	}

	@Override
	//获取下拉列表的值
	public List<SysResource> getSysResourceNameInfo(SysResource sr) {
		String sql = "select * from sys_resource where rejigouid=?";
		Query query = getSession().createSQLQuery(sql).addEntity(SysResource.class);

		query.setInteger(0,sr.getRejigouid()-1);

		return query.list();
	}
}
