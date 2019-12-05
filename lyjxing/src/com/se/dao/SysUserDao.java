package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

public interface SysUserDao {
	
	public List<SysOrg> getSysOrg(int ojigouid);
	
	//��ѯ����֯�ṹ������Ա��Ϣ
	public List<SysUserOut> getSysorguser(String bianma, String start, String length);
	
	//��ȥ�ܵļ�¼����
	public int getSysorgusercount(String bianma, String start, String length);
	
	//����
	public SysUser updateUser(SysUser sUser);
	
	//ɾ���û���Ϣ
	public boolean deleteUser(int uid);
	
	//����
	public boolean addUser(SysUser sUser, String ipconfig);

}
