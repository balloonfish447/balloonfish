package com.se.dao.impl;

import java.util.List;

import com.se.dao.BlogDao;
import com.se.dao.pojo.HpeWenzhang;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class BlogDaoImpl implements BlogDao {
	@Autowired
	private SessionFactory sf;

	public Session getSession() {
		return sf.getCurrentSession();
	}
	
	//默认查询所有的文章信息
	@Override
	public List<HpeWenzhang> getIndex(int pageNum, String leibie) {
		//处理中文字符
		
		if(leibie!=null&&!leibie.equals("")){
			switch (leibie) {
			case "other":
				leibie="其他";
				break;
			case "BigData":
				leibie="大数据";
				break;
			case "Ai":
				leibie="人工智能";
				break;
			case "Desgin":
				leibie="设计";
				break;
			default:
				break;
			}
			//leibie="其他";
		}
		Session session=getSession();
		StringBuilder hql = new StringBuilder("from HpeWenzhang hwz where 1=1 ");
		
		//定义查询个数
		int count =0;
		//设置查询条件
		if(leibie!=null&&!leibie.equals("")){
			hql.append(" and hwz.wenzhangLeibie like ?");
			
		}
		hql.append(" order by hwz.createTime desc");
		Query query=session.createQuery(hql.toString());
		if(leibie!=null&&!leibie.equals("")){
			query.setParameter(count, "%"+leibie+"%");
			count++;
		}
		
		//设置分页
		// 设置起始id
		query.setFirstResult(10 * (pageNum - 1));
		//设置每页显示的条数
		query.setMaxResults(10);
		List<HpeWenzhang> wenzhangs=query.list();
		return wenzhangs;
	}
	
	//获取总页数
	@Override
	public int getTotalPage(String leibie){
		Session session=getSession();
		StringBuilder hql =new StringBuilder("select count(*) from HpeWenzhang hwz where 1=1 ");
		//定义查询个数
		int count =0;
		//设置查询条件
		if (leibie != null && !leibie.equals("")) {
			hql.append(" and hwz.wenzhangLeibie like ?");

		}
		Query query = session.createQuery(hql.toString());
		if (leibie != null && !leibie.equals("")) {
			query.setParameter(count, "%" + leibie + "%");
			count++;
		}
		Number totalSize=(Number) query.uniqueResult();
		// 一共有多少页
		int totalPage=totalSize.intValue()/10;
		if (totalSize.intValue() % 10 != 0) {
			totalPage++;
		}
		return totalPage;
	}
	
	//获取推荐文章，推荐文章以阅读量来进行推荐
	public List<HpeWenzhang> getTuijianWenzhang(){
		Session session=getSession();
		StringBuilder hql = new StringBuilder("from HpeWenzhang hwz order by cast(hwz.wenzhangFangwen as integer) desc ");
		Query query=session.createQuery(hql.toString());
		//从弟1条开始
		query.setFirstResult(0);
		//一共截取5条记录
		query.setMaxResults(10);
		List<HpeWenzhang> wenzhanglists=query.list();
		return wenzhanglists;
	}

}
