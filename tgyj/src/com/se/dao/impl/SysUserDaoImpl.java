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



	//获取用户信息
	@Override
	public List<SysUserOut> getSysorguser(String start,String length) {
		String sql="select su.uid,su.username,su.password,"
				+ "su.email,su.phone,su.register_address as registerAddress,"
				+ "su.register_time as registerTime,su.login_time as loginTime,"
				+ "su.last_login_time as lastLoginTime,su.login_count as loginCount,su.signed,sr.rname "
				+ "from sys_user as su left  join sys_role as sr on su.roleid=sr.rid order by su.register_time desc";

		Query query = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysUserOut.class));


		//Hibernate分页
		query.setFirstResult(Integer.valueOf(start));
		query.setMaxResults(Integer.valueOf(length));
		List<SysUserOut> sus =query.list();
		return sus;
	}

	//获取用户信息总的记录条数
	public int getSysorgusercount(String start,String length) {
		String hql="select count(*) from SysUser as su";
		Query query = getSession().createQuery(hql);



		Number sus =(Number) query.uniqueResult();
		return sus.intValue();
	}

	//用户数据修改
	@Override
	public SysUserOut updateUser(SysUser sUser) {
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
		suupdate.setRoleid(sUser.getRoleid());
		//执行更新操作
		getSession().update(suupdate);
		getSession().flush();
		String sql="select su.uid,su.username,su.password,"
				+ "su.email,su.phone,su.register_address as registerAddress,"
				+ "su.register_time as registerTime,su.login_time as loginTime,"
				+ "su.last_login_time as lastLoginTime,su.login_count as loginCount,su.signed,sr.rname "
				+ "from sys_user as su left  join sys_role as sr on su.roleid=sr.rid "
				+ " where su.uid=?";
		query = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysUserOut.class));
		query.setInteger(0,sUser.getUid());
		SysUserOut suoupdate= (SysUserOut) query.uniqueResult();
		return suoupdate;
	}

	@Override
	//删除用户信息
	public boolean deleteUser(int uid) {
		String hql= "from SysUser where uid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, uid);
		SysUser sUser=(SysUser) query.uniqueResult();
		getSession().delete(sUser);
		return true;
	}

	@Override
	//新增用户信息
	public boolean addUser(SysUser sUser,String ipconfig) {
		sUser.setLoginCount("0");
		sUser.setLastLoginTime(new Date());
		sUser.setLoginTime(new Date());
		sUser.setRegisterAddress(ipconfig);
		sUser.setRegisterTime(new Date());
		sUser.setSigned("这家伙很懒，什么也没有留下");


		getSession().save(sUser);
		return true;
	}

	@Override
	//批量删除用户信息
	public boolean deleteBatchOrgUser(List<Integer> uidList) {
		StringBuilder sql= new StringBuilder("delete from sys_user where uid in(");

		for(int i=0;i<uidList.size();i++){
			if(i==uidList.size()-1){
				sql.append(uidList.get(i));
			}else{
				sql.append(uidList.get(i)+",");
			}

		}
		sql.append(")");
		Query query=getSession().createSQLQuery(sql.toString());
		query.executeUpdate();
		return true;
	}

	@Override
	//判断手机号是否存在
	public boolean checkPhone(String checkphone,String flag) {
		String hql="select count(*) from SysUser where phone=?";
		Query query=getSession().createQuery(hql);
		query.setString(0,checkphone);
		Number num= (Number) query.uniqueResult();
		if(flag!=null&&flag.equals("xiugai")){
			if(num.intValue()>1){
				return false;
			}else{
				return true;
			}
		}else if(flag!=null&&flag.equals("xinzeng")){
			if(num.intValue()>0){
				return false;
			}else{
				return true;
			}
		}
		return false;
	}


}
