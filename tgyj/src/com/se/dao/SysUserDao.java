package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysUser;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

public interface SysUserDao {
	

	

	public List<SysUserOut> getSysorguser( String start, String length);
	
	//��ȡ�û�������
	public int getSysorgusercount( String start, String length);
	
	//�����û���Ϣ
	public SysUserOut updateUser(SysUser sUser);
	
	//ɾ���û���Ϣ
	public boolean deleteUser(int uid);
	
	//�����û���Ϣ
	public boolean addUser(SysUser sUser, String ipconfig);

	//����ɾ���û���Ϣ
	public boolean deleteBatchOrgUser(List<Integer> uidList);

	//��֤�ֻ����Ƿ����
	public boolean checkPhone(String checkphone,String flag);

}
