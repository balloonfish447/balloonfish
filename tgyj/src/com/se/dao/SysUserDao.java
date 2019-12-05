package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

public interface SysUserDao {
	

	

	public List<SysUserOut> getSysorguser( String start, String length);
	
	//获取用户的总数
	public int getSysorgusercount( String start, String length);
	
	//更新用户信息
	public SysUserOut updateUser(SysUser sUser);
	
	//删除用户信息
	public boolean deleteUser(int uid);
	
	//新增用户信息
	public boolean addUser(SysUser sUser, String ipconfig);

	//批量删除用户信息
	public boolean deleteBatchOrgUser(List<Integer> uidList);

	//验证手机号是否存在
	public boolean checkPhone(String checkphone,String flag);

}
