package com.se.service.impl;

import java.util.List;

import com.se.dao.pojo.HpeWenzhang;
import com.se.dao.pojo.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.UploadUserAvatarDao;
import com.se.dao.pojo.SysUser;
import com.se.dao.pojo.HpeWenzhang;
import com.se.service.UploadUserAvatarService;

@Service
public class UploadUserAvatarServiceImpl implements UploadUserAvatarService {

	@Autowired
	private UploadUserAvatarDao uuad;
	//更新用户头像
	@Override
	public void setAvatar(SysUser hu) {
		uuad.setAvatar(hu);
		
	}
	
	//更新用户信息
	@Override
	public String setUserMess(SysUser hu) {
		return uuad.setUserMess(hu);
		
	}

	//更新用户密码
	@Override
	public String setUserPwd(SysUser hu, String nowpass) {
		return uuad.setUserPwd(hu, nowpass);
	}

	//查询用户发布的文章
	@Override
	public List<HpeWenzhang> getHpeWenzhang(SysUser hu,String title,int pageNum) {
		return uuad.getHpeWenzhang(hu,title,pageNum);
	}

	//获取总的发布文章数量
	public int getTotalPage(String title,SysUser hu){
		return  uuad.getTotalPage(title,hu);
	}

	//删除用户发布的文章
	@Override
	public boolean deleteUserBlog(String wenzhangId, String wenzhangTitle,String filepath) {
		return uuad.deleteUserBlog(wenzhangId,wenzhangTitle,filepath);
	}

}
