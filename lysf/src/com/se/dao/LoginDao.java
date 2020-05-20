package com.se.dao;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysUserPowerOut;

import java.util.List;

public interface LoginDao {
	
	public SysUser getLogin(SysUser su);

	//获取用户权限
	public List<SysUserPowerOut> getSysUserPwoer(int rid);

	public boolean zhuce(SysUser suser);

	public boolean phoneyanzheng(String checkphone);

}
