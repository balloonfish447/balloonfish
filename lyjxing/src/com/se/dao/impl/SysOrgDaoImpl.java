package com.se.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.SysOrgDao;
import com.se.dao.pojo.SysOrganize;

@Repository
public class SysOrgDaoImpl implements SysOrgDao{
	@Autowired
	private SessionFactory sf;

	public Session getSession() {
		return sf.getCurrentSession();
	}

	@Override
	//查询组织结构详情
	public List<SysOrganize> getSysOrg(String oid) {
		String hql="from SysOrganize as so where so.oparentid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, Integer.valueOf(oid));
		List<SysOrganize> soList=query.list();
		return soList;
	}

	@Override
	//新增
	public SysOrganize addOrg(SysOrganize so) {
		String hql="select max(ojigouid) from SysOrganize where oparentid=?";
		Query query = getSession().createQuery(hql);
		//把父机构id（ojigouid）在前端映射给了oparentid;
		query.setInteger(0, so.getOparentid());
		Object object=query.uniqueResult();
		int maxojid;
		if(object==null||object.equals("")) {
			object=so.getOparentid()+"0";
			maxojid=Integer.valueOf((String) object)+1;
		}else {
			maxojid=(int)object+1;
		}

		so.setOjigouid(maxojid);
		so.setIsparent(false);
		getSession().save(so);
		//给添加的节点变为父节点
		String sql1="update sys_organize set isparent=true where oid=(select a.oid from(select oid from sys_organize where ojigouid=?)as a)";
		Query query1 = getSession().createSQLQuery(sql1);
		query1.setInteger(0, so.getOparentid());
		query1.executeUpdate();
		return so;
	}

	@Override
	//修改
	public SysOrganize updateOrg(SysOrganize so) {
		SysOrganize so1=(SysOrganize) getSession().get(SysOrganize.class, so.getOid());
		so1.setOjigouid(so.getOjigouid());
		so1.setOname(so.getOname());
		so1.setOparentid(so.getOparentid());
		so1.setOtype(so.getOtype());
		so1.setOzhuangtai(so.getOzhuangtai());
		getSession().update(so1);
		return so1;
	}

	@Override
	public boolean deleteOrg(int oid,int ojigouid) {
		SysOrganize sOrganize=(SysOrganize) getSession().get(SysOrganize.class, oid);
		getSession().delete(sOrganize);
		//如果是父节点，删除父节点下的所有子节点
		if(getOpmess(ojigouid)) {
			String hqlString="delete from sys_organize where oid in (select a.oid from(select oid from sys_organize where oparentid=?)as a)";
			Query query =getSession().createSQLQuery(hqlString);
			query.setInteger(0, ojigouid);
			query.executeUpdate();
		}else {

		}
		return true;
	}

	//判断机构id下是否还有子目录
	public boolean getOpmess(int ojigouid) {
		String hqlString="select count(*) from SysOrganize where oparentid=?";
		Query query=getSession().createQuery(hqlString);
		query.setInteger(0, ojigouid);
		Number number=(Number) query.uniqueResult();
		if(number.longValue()>0) {
			return true;
		}else{
			return false;
		}

	}

}
