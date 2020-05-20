package com.se.service;

import java.util.List;

import com.se.dao.pojo.SysUser;
import com.se.dao.pojo.HpeWenzhang;



public interface UploadUserAvatarService {
	//保存用户头像信息
	public void setAvatar(SysUser hu);
	//修改用户设置的信息
	public String setUserMess(SysUser hu);
	//修改用户密码
	public String setUserPwd(SysUser hu, String nowpass);
	
	//查询用户发布的文章
	public List<HpeWenzhang> getHpeWenzhang(SysUser hu,String title,int pageNum);

	//获取总的发布文章数量
	public int getTotalPage(String title,SysUser hu);

	//删除用户发表的文章
	public boolean deleteUserBlog(String wenzhangId,String wenzhangTitle,String filepath);

}
