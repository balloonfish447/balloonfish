package com.se.service;

import java.util.List;

import com.se.dao.pojo.SysOrganize;

public interface SysOrgService {
	
	//��ѯ��֯�ṹ����
	public List<SysOrganize> getSysOrg(String oid);
	
	//����
	public SysOrganize addOrg(SysOrganize so);
	
	//�޸�
	public SysOrganize updateOrg(SysOrganize so);
	
	//ɾ��
	public boolean deleteOrg(int oid, int ojigouid);

}
