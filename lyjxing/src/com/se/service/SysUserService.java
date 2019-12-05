package com.se.service;

import java.util.List;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

public interface SysUserService {
	
	//��ѯ��֯�ṹ��
	public List<SysOrg> getSysOrg(int ojigouid);
	
	//��ѯ����֯�ṹ������Ա��Ϣ
	public List<SysUserOut> getSysorguser(String bianma, String start, String length);
	
	//��ȡ�������֯�ṹ�µ��û���Ϣ�ܵļ�¼����
	public int getSysorgusercount(String bianma, String start, String length);
	
	//�޸��û���Ϣ
	public SysUser updateUser(SysUser sUser);
	
	//ɾ���û���Ϣ
	public boolean deleteUser(int uid);
	
	//�����û���Ϣ
	public boolean addUser(SysUser sUser, String ipconfig);

}
