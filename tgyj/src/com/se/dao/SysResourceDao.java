package com.se.dao;

import java.util.List;

import com.se.dao.pojo.SysOrganize;
import com.se.dao.pojo.SysResource;
import com.se.vo.SysResourceOut;

public interface SysResourceDao {
	
	//获取资源列表
	public List<SysResourceOut> getSysResource();
	
	//添加资源列表
	public SysResource addResource(SysResource sr);
	
    //修改资源信息
	public SysResource updateResource(SysResource sr);
	
    //删除资源信息
	public boolean deleteResource(int reid);

	//查询下拉列表的值
	public List<SysResource> getSysResourceNameInfo(SysResource sr);
}
