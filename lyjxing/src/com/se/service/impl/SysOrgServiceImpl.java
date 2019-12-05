package com.se.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.SysOrgDao;
import com.se.dao.pojo.SysOrganize;
import com.se.service.SysOrgService;

@Service
public class SysOrgServiceImpl implements SysOrgService{
	@Autowired
	private SysOrgDao sod;
	

	@Override
	//查询组织结构详情
	public List<SysOrganize> getSysOrg(String oid) {
		return sod.getSysOrg(oid);
	}


	@Override
	//新增
	public SysOrganize addOrg(SysOrganize so) {
		
		return sod.addOrg(so);
	}


	@Override
	//修改
	public SysOrganize updateOrg(SysOrganize so) {
		return sod.updateOrg(so);
	}


	@Override
	//删除
	public boolean deleteOrg(int oid,int ojigouid) {
		return sod.deleteOrg(oid,ojigouid);
	}

}
