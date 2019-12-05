package com.se.service.impl;

import com.se.dao.HtmlTemplateDao;
import com.se.service.HtmlTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class HtmlTemplateServiceImpl implements HtmlTemplateService {

	@Autowired
	private HtmlTemplateDao htd;
	
	@Override
	public boolean saveWenzhang(String fileName,String wenzhangLink,String username,String title
			,String spanall,String zhaiyao,String str_src,String user_touxiang) {
		return htd.saveWenzhang(fileName, wenzhangLink, username, title,spanall,zhaiyao,str_src,user_touxiang);
		 
	}
	



}
