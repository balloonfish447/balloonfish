package com.se.service;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysUserPowerOut;

import java.util.List;

public interface LoginService {
	
	public SysUser getLogin(SysUser su);

	//获取用户权限
	public List<SysUserPowerOut> getSysUserPwoer(int rid);

}
