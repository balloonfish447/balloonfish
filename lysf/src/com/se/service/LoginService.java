package com.se.service;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysUserPowerOut;

import java.util.List;

public interface LoginService {
	
	public SysUser getLogin(SysUser su);

	public boolean zhuce(SysUser suser);

	//获取用户权限
	public List<SysUserPowerOut> getSysUserPwoer(int rid);

	public boolean phoneyanzheng(String checkphone);

}
