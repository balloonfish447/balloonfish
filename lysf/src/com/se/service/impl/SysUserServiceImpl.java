package com.se.service.impl;

import java.util.List;
import java.util.Map;

import com.se.dao.pojo.*;
import com.se.vo.sixinOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.SysUserDao;
import com.se.service.SysUserService;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

@Service
public class SysUserServiceImpl implements SysUserService{
	@Autowired
	private SysUserDao sod;


	@Override
	public List<SysUserOut> getSysorguser(String start,String length) {
		return sod.getSysorguser(start,length);
	}

	public List<SysUserOut> getalluser() {
		return sod.getalluser();
	}

	@Override
	public Map<String, Object> getecharts() {
		return sod.getecharts();
	}

	@Override
	public int getSysorgusercount( String start, String length) {
		
		return sod.getSysorgusercount(start, length);
	}

	@Override
	public List<Discuss> getdiscuss() {
		return sod.getdiscuss();
	}

	@Override
	public Notice getnotice() {
		return sod.getnotice();
	}

	@Override
	public boolean deletenotice() {
		return sod.deletenotice();
	}

	@Override
	public boolean addgonggao(Notice notice) {
		return sod.addgonggao(notice);
	}

	@Override
	public boolean addpinglun(String text, int userided) {
		return sod.addpinglun(text,userided);
	}

	@Override
	public boolean addsixin(String text, int userided) {
		return sod.addsixin(text,userided);
	}

	@Override
	public List<sixinOut> getallsixin() {
		return sod.getallsixin();
	}

	public List<sixinOut> getallpinglun(){
		return sod.getallpinglun();
	}

	@Override
	public SysUserOut updateUser(SysUser sUser) {
		
		return sod.updateUser(sUser);
	}

	@Override
	public boolean updateTeam(SysTeam steam) {
		return sod.updateTeam(steam);
	}

	public boolean addteam(SysTeam team){
		return sod.addteam(team);
	}

	@Override
	public boolean deleteUser(int uid) {
		
		return sod.deleteUser(uid);
	}

	@Override
	public SysTeamInformation getteaminfos(int tid) {
		return sod.getteaminfos(tid);
	}

	@Override
	public SysUserInformation getuserinfos(int uid) {
		return sod.getuserinfos(uid);
	}

	@Override
	public boolean deleteTeamuser(int tid,int uid) {
		return sod.deleteTeamuser(tid,uid);
	}

	@Override
	public boolean deleteapplication(int id) {
		return sod.deleteapplication(id);
	}

	@Override
	public boolean addtongyi(int id,int uid,int tid) {
		return sod.addtongyi(id,uid,tid);
	}

	@Override
	public boolean addUser(SysUser sUser,String ipconfig) {
		
		return sod.addUser(sUser,ipconfig);
	}

	@Override
	public boolean zhuceUser(SysUser suser) {
		return sod.zhuceUser(suser);
	}

	@Override
	public boolean phoneyanzheng(String checkphone) {
		return sod.phoneyanzheng(checkphone);
	}

	//批量删除用户信息
	@Override
	public boolean deleteBatchOrgUser(List<Integer> uidList) {
		return sod.deleteBatchOrgUser(uidList);

	}
	//验证手机号是否存在
	@Override
	public boolean checkPhone(String checkphone,String flag){
		return  sod.checkPhone(checkphone,flag);
	}
}
