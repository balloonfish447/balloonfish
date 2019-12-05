package com.se.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


import com.se.dao.pojo.SysUser;
import com.se.service.UploadUserAvatarService;
import com.se.util.UpLoad;

@Controller
@RequestMapping("/uploaduser")
public class UploadUserAvatarController {

	@Autowired
	private UploadUserAvatarService uuas;
	
	@RequestMapping("/avatar")
	public void setUser(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "file", required = false)CommonsMultipartFile file){
		System.out.println(file);
		// 获取当前用户信息
		SysUser hu = (SysUser) request.getSession().getAttribute("USERINFO");
		// 用户不存在跳转到登陆页面
		if (hu == null) {
			try {
				response.sendRedirect("../link/login");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 获取真实路径
		String realPath = request.getSession().getServletContext().getRealPath("/")+"hpecode/res/images/avatar/";
		//获取用户名拼接为头像图片名称
		String username=hu.getUsername();
		String imgname=username+file.getOriginalFilename();
		System.out.println(imgname);
		//上传文件
		UpLoad.upLoad(realPath, file, imgname);
		//设置响应消息
		try {
			PrintWriter out = response.getWriter();
			/*JSONObject json1 = new JSONObject();
			json1.put("code", 1);
			out.print(json1);*/
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//删除用户原来的头像
		/*String avatar_link=hu.getAvatar();
		String realPath1 = request.getSession().getServletContext().getRealPath("/");
		System.out.println(realPath1);
		File file1 = new File(realPath1+avatar_link.substring(8));
		System.out.println(file1);
		if(file1.exists()&&file1.isFile()&&!file1.getName().equals("moren.jpg")){
			file1.delete();
		}else{
			
		}*/
		
		//保存数据到数据库
		//hu.setAvatar("/HPECODE/hpecode/res/images/avatar/"+imgname);
		uuas.setAvatar(hu);
	}

}
