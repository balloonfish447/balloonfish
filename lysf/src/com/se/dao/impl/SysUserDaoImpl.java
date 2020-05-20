package com.se.dao.impl;

import java.util.*;

import com.se.dao.pojo.*;
import com.se.vo.EchartsOut;
import com.se.vo.sixinOut;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.SysUserDao;
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
		String sql="select su.uid,su.sno,su.username,su.password,"
				+ "su.email,su.phone,"
				+ "sr.rname "
				+ "from sys_user as su left join sys_role as sr on su.roleid=sr.rid";

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

	@Override
	public List<SysUserOut> getalluser() {
		String sql="select su.uid,su.sno,su.username,su.password,"
				+ "su.email,su.phone,"
				+ "sr.rname "
				+ "from sys_user as su left join sys_role as sr on su.roleid=sr.rid";

		Query query = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysUserOut.class));
		List<SysUserOut> sus =query.list();
		return sus;
	}

	@Override
	public Map<String, Object> getecharts() {
		String sql="select count(*) as coun,n.tname from sys_user_team t left join sys_team n on"
				+" t.tid=n.tid group by t.tid";

		Query query = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(EchartsOut.class));
		List<EchartsOut> sus =query.list();
		List<Number> jis = new ArrayList<>();
		List<String> bis = new ArrayList<>();
		for (EchartsOut chart:sus) {
			jis.add(chart.getCoun());
			bis.add(chart.getTname());
		}
		Map<String,Object> map = new HashMap<>();
		map.put("jis",jis);
		map.put("bis",bis);
		return map;

	}

	@Override
	public List<Discuss> getdiscuss() {
		String hql= "from Discuss";
		Query query = getSession().createQuery(hql);
		List<Discuss> dis=query.list();

		return dis;
	}

	@Override
	public boolean addpinglun(String text, int userided) {
		Discuss dis=new Discuss();
		dis.setText(text);
		dis.setUid(userided);
		getSession().save(dis);
		return true;
	}

	@Override
	public boolean addgonggao(Notice notice) {
		getSession().save(notice);
		return true;
	}

	@Override
	public boolean addsixin(String text, int userided) {
		Letter letter=new Letter();
		letter.setText(text);
		letter.setUid(userided);
		getSession().save(letter);
		return true;
	}

	@Override
	public List<sixinOut> getallsixin() {
		String sql="select t.*,u.username from letter t left join sys_user u on t.uid=u.uid";
		Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(sixinOut.class));
		List<sixinOut> dis=query1.list();
		return dis;
	}

	@Override
	public List<sixinOut> getallpinglun() {
		String sql="select t.*,u.username from discuss t left join sys_user u on t.uid=u.uid";
		Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(sixinOut.class));
		List<sixinOut> dis=query1.list();
		return dis;
	}

	@Override
	public Notice getnotice() {
		//SELECT * FROM sys_user ORDER BY uid DESC LIMIT 0,1
		String sql="SELECT * FROM notice ORDER BY id DESC LIMIT 0,1";
		Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(Notice.class));
		Notice notice=(Notice)query1.uniqueResult();
		return notice;
	}

	@Override
	public boolean deletenotice() {
		//System.out.println("调用成功");
        Notice notice=getnotice();
		String sql="SELECT * FROM notice where id not in ("+notice.getId()+")";
		Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(Notice.class));
        List<Notice> noticeList=query1.list();
        if(noticeList!=null) {
			for (Notice n : noticeList) {
				getSession().delete(n);
			}
		}

		return true;
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
		suupdate.setUsername(sUser.getSno());
		suupdate.setUsername(sUser.getUsername());
		suupdate.setPassword(sUser.getPassword());
		suupdate.setEmail(sUser.getEmail());
		suupdate.setPhone(sUser.getPhone());
		suupdate.setRoleid(sUser.getRoleid());
		//执行更新操作
		getSession().update(suupdate);
		getSession().flush();
		String sql="select su.uid,su.sno,su.username,su.password,"
				+ "su.email,su.phone,"
				+ "sr.rname "
				+ "from sys_user as su left  join sys_role as sr on su.roleid=sr.rid "
				+ " where su.uid=?";
		query = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysUserOut.class));
		query.setInteger(0,sUser.getUid());
		SysUserOut suoupdate= (SysUserOut) query.uniqueResult();
		return suoupdate;
	}

	@Override
	public boolean updateTeam(SysTeam steam) {
		//查询需要修改的对象
		String hql="from SysTeam where tid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, steam.getTid());
		SysTeam suupdate=(SysTeam) query.uniqueResult();
		//获取修改之前的uid
		int olduid=suupdate.getUid();
		//通过表单提交的更新数据
		suupdate.setTname(steam.getTname());
		suupdate.setUid(steam.getUid());
		//执行更新操作
		getSession().update(suupdate);

		//判断旧社长用户是否需要修改权限
		if (olduid!=steam.getUid()){
			//修改新社长用户的权限
			String hqlnewuser="from SysUser where uid=?";
			Query query0=getSession().createQuery(hqlnewuser);
			query0.setInteger(0, steam.getUid());
			SysUser newuser=(SysUser) query0.uniqueResult();
			newuser.setRoleid(2);
			getSession().update(newuser);

			//查询原社长用户判断是否还能拥有相应权限
			String hql1="from SysTeam where uid=?";
			Query query1=getSession().createQuery(hql1);
			query.setInteger(0, olduid);
			List<SysTeam> userteam= query1.list();
			if(userteam.size()==0){
				String hql2="from SysUser where uid=?";
				Query query2=getSession().createQuery(hql2);
				query.setInteger(0, olduid);
				SysUser user=(SysUser) query2.uniqueResult();
				user.setRoleid(3);
				getSession().update(user);
			}

		}

		return true;
	}

	public boolean addteam(SysTeam team){
		getSession().save(team);
		return true;
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
	public SysUserInformation getuserinfos(int uid) {
		String hql= "from SysUserInformation where uid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, uid);
		SysUserInformation sUser=(SysUserInformation) query.uniqueResult();
		return sUser;
	}

	@Override
	public SysTeamInformation getteaminfos(int tid) {
//		String hql= "from SysTeamInformation where tid=?";
//		Query query = getSession().createQuery(hql);
//		query.setInteger(0, tid);
//		SysTeamInformation steam=(SysTeamInformation) query.uniqueResult();
//		return steam;
		//SELECT * FROM sys_user ORDER BY uid DESC LIMIT 0,1
		String sql="SELECT * FROM teaminformation where tid="+tid;
		Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysTeamInformation.class));
		SysTeamInformation notice=(SysTeamInformation)query1.uniqueResult();
		return notice;
	}

	@Override
	public boolean deleteTeamuser(int tid,int uid) {
		String hql= "from SysUserTeam where uid=? and tid=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, uid);
		query.setInteger(1, tid);
		//SysUser sUser=(SysUser) query.uniqueResult();
		SysUserTeam tUser=(SysUserTeam)query.uniqueResult();
		getSession().delete(tUser);
		return true;
	}

	@Override
	//新增用户信息
	public boolean addUser(SysUser sUser,String ipconfig) {
	getSession().save(sUser);
		return true;
	}

	@Override
	public boolean phoneyanzheng(String checkphone) {
		String hql="select count(*) from SysUser where phone=?";
		Query query=getSession().createQuery(hql);
		query.setString(0,checkphone);
		Number num= (Number) query.uniqueResult();

			if(num.intValue()>0){
				return false;
			}

		return true;
	}

	//注册用户
	@Override
	public boolean zhuceUser(SysUser suser) {
		getSession().save(suser);
		return true;
	}

	@Override
	public boolean addtongyi(int id,int uid,int tid) {
		String hql="select count(*) from SysUserTeam where uid=? and tid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0,uid);
		query.setInteger(1,tid);
		Number num= (Number) query.uniqueResult();

		if(num.intValue()>0){
			return false;
		}

		SysUserTeam ut=new SysUserTeam();
		ut.setTid(tid);
		ut.setUid(uid);
		getSession().save(ut);
		//getSession().flush();

		return deleteapplication(id);
	}

	@Override
	public boolean deleteapplication(int id) {
		String hql= "from SysApplication where id=?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, id);

		//SysUser sUser=(SysUser) query.uniqueResult();
		SysApplication aUser=(SysApplication)query.uniqueResult();
		getSession().delete(aUser);
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
