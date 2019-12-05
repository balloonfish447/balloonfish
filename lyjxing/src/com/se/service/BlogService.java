package com.se.service;

import com.se.dao.pojo.HpeWenzhang;

import java.util.List;


public interface BlogService {
	
	public List<HpeWenzhang> getIndex(int pageNum, String leibie);
	
	//获取总页数
	public int getTotalPage(String leibie);
	
	//获取推荐文章，推荐文章以阅读量来进行推荐
	public List<HpeWenzhang> getTuijianWenzhang();

		

}
