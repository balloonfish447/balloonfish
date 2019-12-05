package com.se.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.se.dao.pojo.SysUser;
import com.se.util.UpLoad;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;




@Controller
@RequestMapping("/upload")
public class UpLoadImagesController {

	@RequestMapping(value=("/uploadImages"),method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> uploadImages(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "file", required = false)CommonsMultipartFile file){
		//UpLoad ul = new UpLoad();
		SysUser hu=(SysUser) request.getSession().getAttribute("USERINFO");

		//用户不存在跳转到登陆页面
		if(hu==null){
			try {
				response.sendRedirect("../link/tologin") ;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String uname=String.valueOf(System.currentTimeMillis());
		
		//获取真实路径
		String realPath=request.getSession().getServletContext().getRealPath("/")+"blog/imgs/";

		//文件名
		String oname=file.getOriginalFilename();

		String fileName= uname+oname;

		UpLoad.upLoad(realPath, file, fileName);
		Map<String,String> data= new HashMap<String,String>();
		String srcname="/lyjxing/blog/imgs/"+fileName;
		data.put("path",srcname);


		return data;

		
	}
}
