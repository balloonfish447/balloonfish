package com.se.dao;

import java.util.List;
import java.util.Map;

import com.se.dao.pojo.*;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;
import com.se.vo.sixinOut;

public interface SysUserDao {
	

	

	public List<SysUserOut> getSysorguser( String start, String length);

	public List<SysUserOut> getalluser();
	public Map<String,Object> getecharts();
	
	//获取用户的总数
	public int getSysorgusercount( String start, String length);

	public List<Discuss> getdiscuss();
	public Notice getnotice();

	public boolean deletenotice();

	public boolean addpinglun(String text,int userided);
	public boolean addgonggao(Notice notice);

	public boolean addsixin(String text,int userided);
	public List<sixinOut> getallsixin();

	public List<sixinOut> getallpinglun();
	
	//更新用户信息
	public SysUserOut updateUser(SysUser sUser);

	public boolean updateTeam(SysTeam steam);

	public boolean addteam(SysTeam team);
	
	//删除用户信息
	public boolean deleteUser(int uid);

	public SysTeamInformation getteaminfos(int tid);

	public SysUserInformation getuserinfos(int uid);

	public boolean deleteTeamuser(int tid,int uid);

	public boolean deleteapplication(int id);

	public boolean addtongyi(int id,int uid,int tid);
	
	//新增用户信息
	public boolean addUser(SysUser sUser, String ipconfig);

	public boolean zhuceUser(SysUser suser);

	public boolean phoneyanzheng(String checkphone);

	//批量删除用户信息
	public boolean deleteBatchOrgUser(List<Integer> uidList);

	//验证手机号是否存在
	public boolean checkPhone(String checkphone,String flag);

}
