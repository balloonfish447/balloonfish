package com.se.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.dao.pojo.SysOrganize;
import com.se.dao.pojo.SysUser;
import com.se.service.SysOrgService;

@Controller
@RequestMapping("/system/")
public class SysOrgController {
	@Autowired
	private SysOrgService sos;


	//查询组织结构详情
	@RequestMapping("sysorginfo")
	@ResponseBody
	public List<SysOrganize> getSysOrg(String oid){
		return sos.getSysOrg(oid);
	}

	//新增组织结构
	@RequestMapping("addorg")
	@ResponseBody
	public SysOrganize addOrg(SysOrganize so){
		return sos.addOrg(so);
	}

	//修改组织信息
	@RequestMapping("updateorg")
	@ResponseBody
	public SysOrganize updateOrg(SysOrganize so){
		return sos.updateOrg(so);


	}

	//删除组织信息
	@RequestMapping("deleteorg")
	@ResponseBody
	public boolean deleteOrg(@RequestParam(value="oid")int oid,@RequestParam(value="ojigouid")int ojigouid){
		return sos.deleteOrg(oid,ojigouid);


	}


}
