package com.se.service;

import java.util.List;

import com.se.dao.pojo.SysRole;

public interface SysRoleService {
	
	//��ѯ��֯�ṹ�µĽ�ɫ��Ϣ
	public List<SysRole> getSysRoleInfo(int oid);
	
	//����
	public SysRole addRole(SysRole sr);

}
