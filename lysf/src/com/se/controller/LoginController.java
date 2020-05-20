package com.se.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.se.vo.SysUserPowerOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.dao.pojo.SysUser;
import com.se.service.LoginService;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping()
public class LoginController {
	@Autowired
	private LoginService ls;
	SysUser sysUser=null;
	@RequestMapping("/login")
	public String getLogin(SysUser su,HttpServletRequest request) throws JsonProcessingException {
		 sysUser=ls.getLogin(su);
		//获取session
		HttpSession session = request.getSession();
		if(sysUser!=null) {
			//把用户信息放入到session中
			session.setAttribute("USERINFO", sysUser);
			List<SysUserPowerOut> sups= getSysUserPwoer();
			ObjectMapper mapper = new ObjectMapper();
			String powerjson=mapper.writeValueAsString(sups);
			session.setAttribute("USERPOWER",powerjson);
			return "redirect:systementry/jsp/index.jsp";
		}else {
			request.setAttribute("errorlogin","用户名或者密码错误");
			return "forward:systementry/jsp/login.jsp";
		}
	}

	//获取用户权限数据
	/*@RequestMapping("/userpower")
	@ResponseBody*/
	public List<SysUserPowerOut> getSysUserPwoer(){
		if(sysUser!=null){
			List<SysUserPowerOut> sups= ls.getSysUserPwoer(sysUser.getRoleid());
			return sups;
		}

		return null;
	}

	@RequestMapping("/zhuce")
	@ResponseBody
	public boolean zhuceUser(SysUser suser){
		boolean b=ls.zhuce(suser);
		return b;
	}
	@RequestMapping("/phoneyan")
	@ResponseBody
	public void phoneyanzheng(String checkphone,String flag, HttpServletResponse response) throws IOException {
		boolean a=ls.phoneyanzheng(checkphone);
		response.setContentType("application/json");
		if(a){

			response.getWriter().write("{\"valid\":true}");

		}else{

			response.getWriter().write("{\"valid\":false}");
		}



	}
	

}
