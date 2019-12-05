package com.se.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.SysUserDao;
import com.se.dao.pojo.SysUser;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

@Repository
public class SysUserDaoImpl implements SysUserDao{
	@Autowired
	private SessionFactory sf;

	public Session getSession() {
		return sf.getCurrentSession();
	}

	//获取组织结构信息
	@Override
	public List<SysOrg> getSysOrg(int ojigouid) {
		String hql="select ojigouid as id,oparentid as pId,oname as name,isparent as isParent  from SysOrganize where oparentid=?";
		Query query=getSession().createQuery(hql).setResultTransformer(Transformers.aliasToBean(SysOrg.class));
		query.setInteger(0, ojigouid);
		List<SysOrg> sosList=query.list();
		return sosList;
	}

	//获取点击的组织结构下的用户信息
	@Override
	public List<SysUserOut> getSysorguser(String bianma,String start,String length) {
		String sql="select su.uid,su.username,su.password,"
				+ "su.email,su.phone,su.register_address as registerAddress,"
				+ "su.register_time as registerTime,su.login_time as loginTime,"
				+ "su.last_login_time as lastLoginTime,su.login_count as loginCount,su.signed,sr.rname "
				+ "from sys_user as su left  join sys_role as sr on su.roleid=sr.rid "
				+ "where su.organizeid=:site1 or su.opid=:site2";
		String hql="from sys_user as su where su.organizeid=:site1 or su.opid=:site2";
		Query query = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysUserOut.class));

		query.setInteger("site1", Integer.valueOf(bianma));
		query.setInteger("site2", Integer.valueOf(bianma));
		//Hibernate分页
		query.setFirstResult(Integer.valueOf(start));
		query.setMaxResults(Integer.valueOf(length));
		List<SysUserOut> sus =query.list();
		return sus;
	}

	//获取点击的组织结构下的用户信息总的记录条数
	public int getSysorgusercount(String bianma,String start,String length) {
		String hql="select count(*) from SysUser as su where su.organizeid=:site1 or su.opid=:site2";
		Query query = getSession().createQuery(hql);

		query.setInteger("site1", Integer.valueOf(bianma));
		query.setInteger("site2", Integer.valueOf(bianma));

		Number sus =(Number) query.uniqueResult();
		return sus.intValue();
	}

	//用户数据修改
	@Override
	public SysUser updateUser(SysUser sUser) {
		//查询需要修改的对象
		String hql="from SysUser where uid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, sUser.getUid());
		SysUser suupdate=(SysUser) query.uniqueResult();
		//通过表单提交的更新数据
		suupdate.setUsername(sUser.getUsername());
		suupdate.setPassword(sUser.getPassword());
		suupdate.setEmail(sUser.getEmail());
		suupdate.setPhone(sUser.getPhone());
		//执行更新操作
		getSession().update(suupdate);
		return suupdate;
	}

	@Override
	public boolean deleteUser(int uid) {
		String hql= "from SysUser where uid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, uid);
		SysUser sUser=(SysUser) query.uniqueResult();
		getSession().delete(sUser);
		return true;
	}

	@Override
	public boolean addUser(SysUser sUser,String ipconfig) {
		sUser.setLoginCount("0");
		sUser.setLastLoginTime(new Date());
		sUser.setLoginTime(new Date());
		sUser.setRegisterAddress(ipconfig);
		sUser.setRegisterTime(new Date());
		sUser.setSigned("这家伙很懒，什么也没有留下");
		sUser.setRoleid(6);

		getSession().save(sUser);
		return true;
	}

}
