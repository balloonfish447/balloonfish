package com.se.service;

import java.util.List;

import com.se.dao.pojo.SysResource;
import com.se.dao.pojo.SysRole;

public interface SysPowerService {
	
	//��ȡ��֯�ṹ��Ӧ�Ľ�ɫ��Ϣ
	public List<SysRole> getSysPowerRole(int oid);
	
	//���ݽ�ɫ��Ϣ��ȡ��ɫ��Ȩ��
	public List<SysResource> getSysPower(int rid);
	
	//��ȡ��Դ�б������Ȩ
	public List<SysResource> getSysResource();

}
