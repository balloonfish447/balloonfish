package com.se.service;

import java.util.List;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

public interface SysUserService {
	


	

	public List<SysUserOut> getSysorguser( String start, String length);
	

	public int getSysorgusercount(String start, String length);
	

	public SysUserOut updateUser(SysUser sUser);
	

	public boolean deleteUser(int uid);
	

	public boolean addUser(SysUser sUser, String ipconfig);

	//批量删除数据
	public boolean deleteBatchOrgUser(List<Integer> uidList);

	//验证手机号是否存在
	public boolean checkPhone(String checkphone,String flag);

}
