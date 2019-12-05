package com.se.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;



import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.se.dao.HtmlTemplateDao;
import com.se.dao.pojo.HpeWenzhang;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class HtmlTemplateDaoImpl implements HtmlTemplateDao {

	@Autowired
	private SessionFactory sf;

	public Session getSession() {
		return sf.getCurrentSession();
	}
	
	
	//保存文章部分内容到数据库
	@Override
	public boolean saveWenzhang(String fileName,String wenzhangLink,String username,
			String title,String spanall,String zhaiyao,String str_src,String user_touxiang) {
		Session session =getSession();
		
		//设置文章参数
		HpeWenzhang hwz = new HpeWenzhang();
		hwz.setWenzhangUserTouxiang(user_touxiang);
		hwz.setWenzhangTitle(title);
		hwz.setWenzhangFangwen("0");
		hwz.setWenzhangLink(wenzhangLink);
		hwz.setWenzhangName(fileName);
		hwz.setWenzhangTuijian("0");
		hwz.setWenzhangUser(username);
		hwz.setCreateTime(new Date());
		hwz.setWenzhangLeibie("ALL");
		hwz.setWenzhangZhaiyao(zhaiyao);
		hwz.setWenzhangTupianlink(str_src);
		//hwz.setHpeWenzhangleibies(hpeWenzhangleibies);
		session.save(hwz);
		return true;
	}

}
