package com.se.service.impl;

import java.util.List;

import com.se.dao.BlogDao;

import com.se.dao.pojo.HpeWenzhang;
import com.se.service.BlogService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogDao idao;
	
	@Override
	public List<HpeWenzhang> getIndex(int pageNum, String leibie) {
		return idao.getIndex(pageNum,leibie);
	}

	//获取总页数
	@Override
	public int getTotalPage(String leibie) {
		return idao.getTotalPage(leibie);
	}

	//获取推荐文章
	@Override
	public List<HpeWenzhang> getTuijianWenzhang() {
		
		return idao.getTuijianWenzhang();
	}



}
