package com.se.dao.impl;

import java.util.List;

import com.se.dao.pojo.SysPower;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
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
	//获取角色的信息列表
	public List<SysRole> getSysPowerRole() {
		String hqlString="from SysRole";
		Query query = getSession().createQuery(hqlString);

		return query.list();
		
		
	}

	@Override
	//保存角色选择的权限
	public boolean saveSysPower(int rid,Integer [] reids) {
		//先删除角色原来的权限
		String sql="delete from sys_power where rid=?";
		Query query=getSession().createSQLQuery(sql);
		query.setInteger(0,rid);
		query.executeUpdate();
		//批量插入选择的权限

		if(reids!=null&&reids.length>0){
			for(int reid:reids){
				SysPower sp = new SysPower();
				sp.setRid(rid);
				sp.setReid(reid);
				getSession().save(sp);
				getSession().flush();
			}
		}
		return true;
	}

	@Override
	//根据角色构建资源列表tree，并查询该角色的关联权限
	public List<SysOrg> getSysResourceTree(int rid) {
		//查询资源结构树
		String sqlString="SELECT " +
				"sr.reid AS id, " +
				"sr.reopjigouid AS pId, " +
				"sr.resourcename AS name, " +
				"sp.reid as reid " +
				"from " +
				"sys_resource AS sr " +
				"LEFT JOIN sys_power AS sp on sp.rid=? and sp.reid=sr.reid";
		Query query =getSession().createSQLQuery(sqlString).setResultTransformer(Transformers.aliasToBean(SysOrg.class));
		query.setInteger(0,rid);
		List<SysOrg> srsList = query.list();
		for(SysOrg so:srsList){
			if(so.getReid()!=null){
				so.setChecked(true);
			}else{
				so.setChecked(false);
			}
		}


		return srsList;
	}

}
