package com.se.controller;

import java.util.List;

import com.se.dao.pojo.SysResource;
import com.se.vo.SysResourceOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.dao.pojo.SysOrganize;
import com.se.service.SysResourceService;

@Controller
@RequestMapping("/system/")
public class SysResourceController {
	@Autowired
	private SysResourceService srs;


	//查询资源列表详情
	@RequestMapping("sysresourceinfo")
	@ResponseBody
	public List<SysResourceOut> getSysResource(){
		return srs.getSysResource();
	}

	//新增资源
	@RequestMapping("addresource")
	@ResponseBody
	public SysResource addResource(SysResource sr){
		return srs.addResource(sr);
	}


	//修改资源信息
	@RequestMapping("updateresource")
	@ResponseBody
	public SysResource updateResource(SysResource sr){
		return srs.updateResource(sr);


	}

	//删除资源信息
	@RequestMapping("deleteresource")
	@ResponseBody
	public boolean deleteResource(@RequestParam(value="reid")int reid){
		return srs.deleteResource(reid);


	}

	//新增下拉列表值获取
	@RequestMapping("selectresourcenameinfo")
	@ResponseBody
	public List<SysResource> getSysResourceNameInfo(SysResource sr){
		return srs.getSysResourceNameInfo(sr);
	}


}
