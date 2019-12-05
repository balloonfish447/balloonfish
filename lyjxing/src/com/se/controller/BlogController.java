package com.se.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.se.dao.pojo.HpeWenzhang;
import com.se.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/*
* 文章列表页面
* */
@Controller
@RequestMapping("hpe")
public class BlogController {
	
	@Autowired
	private BlogService is;
	
	@RequestMapping("/index")
	public String getIndex(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="page",required=false)String page,
			@RequestParam(value="leibie",required=false)String leibie){
		//处理当前页
		int pageNum=1;
		if(page!=null&&!page.equals("")&&!page.equals("undefined")){
			pageNum=Integer.valueOf(page);
		}
		//全部选择处理
		if((leibie!=null&&leibie.equals("ALL"))||(leibie!=null&&leibie.equals("全部"))){
			leibie="";
		}
		//获取当前页的显示内容
		List<HpeWenzhang> list=is.getIndex(pageNum,leibie);
		//获取总页数
		int totalPage=is.getTotalPage(leibie);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("pageNum", pageNum);
		
		//获取推荐文章
		//List<HpeWenzhang> tuijianwenzhanglist=is.getTuijianWenzhang();


		if(list!=null){
			request.setAttribute("wenzhanglist", list);
			//request.setAttribute("tuijianwenzhanglist", tuijianwenzhanglist);

			return "forward:/blog.jsp";
		}else{
			return "404";
		}
		
	}

}
