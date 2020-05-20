package com.se.dao.impl;

import java.io.File;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.dao.UploadUserAvatarDao;
import com.se.dao.pojo.SysUser;
import com.se.dao.pojo.HpeWenzhang;

@Repository
public class UploadUserAvatarDaoImpl implements UploadUserAvatarDao{
	@Autowired
	private SessionFactory sf;

	public Session getSession() {
		return sf.getCurrentSession();
	}
	
	//更新用户头像
	@Override
	public void setAvatar(SysUser hu) {
		getSession().update(hu);
		
	}

	//更新用户信息
	@Override
	public String setUserMess(SysUser hu) {
		//查看用户名是否已经存在
		String hql = "select count(*) from SysUser as hu where hu.username = ?";
		Query query=getSession().createQuery(hql);
		query.setString(0, hu.getUsername());
		Number num=(Number) query.uniqueResult();
		int count =num.intValue();
		if(count>1){
			return "用户名已经存在或邮箱已存在";
		}else{
			getSession().update(hu);
			return "修改成功";
		}
		
		
	}

	//修改用户密码
	@Override
	public String setUserPwd(SysUser hu, String nowpass) {
		//查看用户密码是否正确
		String hql = "select count(*) from HpeUser as hu where hu.email = ? and hu.password= ?";
		Query query=getSession().createQuery(hql);
		query.setString(0, hu.getEmail());
		query.setString(1, nowpass);
		Number num=(Number) query.uniqueResult();
		int count =num.intValue();
		if(count>0){
			getSession().update(hu);
			return "修改成功";
			
		}else{
			return "你输入的密码不正确";
		}
		
	}

	//查询用户发布的文章
	@Override
	public List<HpeWenzhang> getHpeWenzhang(SysUser hu,String title,int pageNum) {
		StringBuilder hql =new StringBuilder("from HpeWenzhang as hwz where hwz.wenzhangUser=:wenzhangUser ");
		if(title!=null&&!title.equals("")){
			hql.append(" and hwz.wenzhangTitle like :title ");
		}
		hql.append(" order by hwz.createTime desc");

		Query query =getSession().createQuery(hql.toString());

		query.setString("wenzhangUser", hu.getUsername());

		if(title!=null&&!title.equals("")){
			query.setString("title","%" + title + "%");
		}


		//设置分页
		// 设置起始id
		query.setFirstResult(10 * (pageNum - 1));
		//设置每页显示的条数
		query.setMaxResults(10);
		List<HpeWenzhang> hwzs=query.list();
		return hwzs;
	}

	//获取用户发布文章的总页数
	public int getTotalPage(String title,SysUser hu){
		Session session=getSession();
		StringBuilder hql =new StringBuilder("select count(*) from HpeWenzhang hwz where hwz.wenzhangUser=:wenzhangUser ");

		//设置查询条件
		if (title != null && !title.equals("")) {
			hql.append(" and hwz.wenzhangTitle like :title");

		}
		hql.append(" order by hwz.createTime desc");

		Query query = session.createQuery(hql.toString());
		query.setString("wenzhangUser", hu.getUsername());
		if (title != null && !title.equals("")) {
			query.setParameter("title", "%" + title + "%");

		}
		Number totalSize=(Number) query.uniqueResult();
		// 一共有多少页
		int totalPage=totalSize.intValue()/10;
		if (totalSize.intValue() % 10 != 0) {
			totalPage++;
		}
		return totalPage;
	}

	@Override
	//删除用户发布的文章

	public boolean deleteUserBlog(String wenzhangId, String wenzhangTitle,String filepath) {

		//删除数据库中的数据
		Session session=getSession();
		HpeWenzhang deletehwz= (HpeWenzhang) session.get(HpeWenzhang.class,Integer.valueOf(wenzhangId));
		session.delete(deletehwz);
		//删除生成的html文件
		File file = new File(filepath+wenzhangTitle);
		if(file.exists() &&file.isFile()){
			file.delete();
		}
		return true;
	}

}
