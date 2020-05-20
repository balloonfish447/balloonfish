package com.se.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.se.dao.pojo.HpeWenzhang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.dao.pojo.SysUser;
import com.se.dao.pojo.HpeWenzhang;
import com.se.service.UploadUserAvatarService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("set")
public class SetUserController {
	@Autowired
	private UploadUserAvatarService uuas;
	
	@RequestMapping("/usermess")
	public String setUser(String username,
			String password,String email,HttpServletRequest request){
		//获取用户对象
		SysUser hu = (SysUser) request.getSession().getAttribute("USERINFO");
		//更新用户数据信息
		hu.setEmail(email);
		hu.setUsername(username.trim());

		hu.setPassword(password.trim());


		String set_mess=uuas.setUserMess(hu);
		if(set_mess!=null &&set_mess.equals("修改成功")){
			request.getSession().setAttribute("USERINFO",hu);
		}

		request.setAttribute("set_mess", set_mess);
		return "userset";
	}
	
	@RequestMapping("/repass")
	public String setRepass(String nowpass,String password,HttpServletRequest request){
		//获取用户对象
		SysUser hu = (SysUser) request.getSession().getAttribute("USERINFO");
		//更新用户密码信息
		hu.setPassword(password);
		String set_mess=uuas.setUserPwd(hu, nowpass);
		request.setAttribute("set_mess", set_mess);
		request.setAttribute("jiaodian", "repass");
		return "forward:/link/user_set";
	}
	
	//查询用户所有发的帖子
	@RequestMapping("/user_index")
	public String getUserIndex(HttpServletRequest request,
							   @RequestParam(value = "title",required = false)String title,
							   @RequestParam(value = "page",required = false)String page) {

		//获取用户信息ֵ
		SysUser hu = (SysUser) request.getSession().getAttribute("USERINFO");
		if(hu==null){
		 	return "forward:/link/tologin" ;
		 }else{
			int pageNum=1;
			if(page!=null&&!page.equals("")&&!page.equals("undefined")){
				pageNum=Integer.valueOf(page);
			}
			//获取总页数
			int totalPage=uuas.getTotalPage(title,hu);

			 //查询用户发布的文章和帖子
			List<HpeWenzhang> hwzs= uuas.getHpeWenzhang(hu,title, pageNum);
			if(hwzs!=null){
				request.setAttribute("totalPage", totalPage);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("count_wenzhang", hwzs.size());
				request.setAttribute("title",title);
				request.setAttribute("hwzs", hwzs);
				return "userblog";
			}else{
				return "userbolg";
			}

		 }
			
	}

	//删除用户发布的文章
	@RequestMapping("/deleteUserBlog")
	@ResponseBody
	public boolean deleteUserBlog(String wenzhangId,String wenzhangTitle, HttpServletRequest request){
		//获取html文件的地址
		String filepath=request.getSession().getServletContext()
				.getRealPath("/")+"blog/html/";
		boolean b=uuas.deleteUserBlog(wenzhangId,wenzhangTitle,filepath);

		return b;

	}

}
