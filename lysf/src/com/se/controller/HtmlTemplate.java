package com.se.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.se.dao.pojo.SysUser;
import com.se.service.HtmlTemplateService;
import com.se.util.TemplateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;


/*
* 创建静态html文档
* */
@Controller
@RequestMapping("freemarker")
public class HtmlTemplate {
	
	 @Autowired
	 private FreeMarkerConfigurer config;

	 @Autowired
	 private HtmlTemplateService hts;

	
	 /**
	  * 
	  * @param request
	  * @param response
	  * @param textarea1 html内容
	  * @param title
	  * @param textarea2 纯文本内容
	  * 创建文章方法
	  */
	 @RequestMapping(value="/createBlog", method=RequestMethod.POST)
	    public void Add(HttpServletRequest request, HttpServletResponse response,
	    		String textarea1,String title,
	    		String textarea2) {
		    //处理特殊字符
			String regEx="[`~!@#$%^&*()+=|{}\':;\',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】'；：’。，、？]" ;
		 	Pattern   p   =   Pattern.compile(regEx);
	        Matcher   m   =   p.matcher(textarea2);      
	        String textare=m.replaceAll("").trim();
		 
		 	//获取真实路径
		 	String realpath = request.getSession().getServletContext()
					.getRealPath("/")+"blog/html/";
		 	//获取用户信息ֵ
		 	SysUser hu = (SysUser) request.getSession().getAttribute("USERINFO");
		 	if(hu==null){
		 		try {
					response.sendRedirect("../link/login") ;
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 	}else{
		 		//格式化时间
		 		System.out.println(System.currentTimeMillis());
			 	String fileName =System.currentTimeMillis()+".html";

		        //提取文章摘要
		        String zhaiyao1=textare.substring(0, 150).toString().trim();
		        TemplateUtils templateUtils = new TemplateUtils();
		        Map<String, Object> map = new HashMap<String, Object>();
		        //生成html页面
		        //格式化发布时间
		        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		        String wenzhangLink="blog/html/"+fileName;
		        String fabutime=sdf1.format(new Date());
		        map.put("title", title);
		        map.put("username", hu.getUsername());		        
		        map.put("textarea", textarea1);
		        map.put("USERINFO", hu);
		        map.put("fabutime",fabutime);

		        map.put("wenzhangLink", wenzhangLink);
		        map.put("zhaiyao1", zhaiyao1);
		        
		        //解析所属标签

		        templateUtils.createHtml("blog-details.ftl",map,"/com/se/freemarker",realpath,fileName);
		 	
		      //  String wenzhangLink="hpecode/html/"+fileName;
		        
		        //保存信息到数据库
		        String zhaiyao=zhaiyao1.substring(0, 100).toString().trim();
		        //提取文章图片信息
		        String str_src="";
		        Pattern p_img = Pattern.compile("<(img|IMG)(.*?)(/>|></img>|>)");
		        Matcher m_img = p_img.matcher(textarea1);
		        boolean result_img = m_img.find();
		        if (result_img) {
		            while (result_img) {
		                //获取到匹配的<img />标签中的内容
		                String str_img = m_img.group(2);
		                 
		                //开始匹配<img />标签中的src
		                Pattern p_src = Pattern.compile("(src|SRC)=(\"|\')(.*?)(\"|\')");
		                Matcher m_src = p_src.matcher(str_img);
		                if (m_src.find()) {
		                    str_src = m_src.group(3);
		                    break;
		                }
		               
		                 
		               
		            }
		        }
		        
		        System.out.println(str_src);
		        hts.saveWenzhang(fileName,wenzhangLink,hu.getUsername(),title,"",zhaiyao,str_src,"");

		        try {
					response.sendRedirect("../blog/html/"+fileName) ;
				} catch (IOException e) {
				
					e.printStackTrace();
				}
		 	}
		 	

	       
	    }
	 
	 

}
