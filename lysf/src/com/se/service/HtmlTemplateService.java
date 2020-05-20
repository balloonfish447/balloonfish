package com.se.service;

public interface HtmlTemplateService {
	
	//保存文章内容到数据库
	public boolean saveWenzhang(String fileName, String wenzhangLink, String username, String title,
                                String spanall, String zhaiyao, String str_src, String user_touxiang);
	

}
