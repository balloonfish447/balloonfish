package com.se.service.impl;

import java.util.List;

import com.se.dao.pojo.SysResource;
import com.se.vo.SysResourceOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.dao.SysResourceDao;
import com.se.dao.pojo.SysOrganize;
import com.se.service.SysResourceService;

@Service
public class SysResourceServiceImpl implements SysResourceService {
	@Autowired
	private SysResourceDao srd;
	

	@Override

	//查询资源列表详情
	public List<SysResourceOut> getSysResource() {
		return srd.getSysResource();
	}


	@Override

	public SysResource addResource(SysResource sr) {
		
		return srd.addResource(sr);
	}


	@Override
    //修改资源信息
	public SysResource updateResource(SysResource sr) {
		return srd.updateResource(sr);
	}


	@Override
    //删除资源信息
	public boolean deleteResource(int reid) {
		return srd.deleteResource(reid);
	}

	@Override
	public List<SysResource> getSysResourceNameInfo(SysResource sr) {
		return srd.getSysResourceNameInfo(sr);

	}
}
