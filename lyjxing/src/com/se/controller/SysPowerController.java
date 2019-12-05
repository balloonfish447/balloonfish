package com.se.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.dao.pojo.SysResource;
import com.se.dao.pojo.SysRole;
import com.se.service.SysPowerService;
import com.se.vo.SysOrg;

@Controller
@RequestMapping("/system/")
public class SysPowerController {
	@Autowired
	private SysPowerService sps;

	//构建角色信息树
	@RequestMapping("syspowerrole")
	@ResponseBody
	public List<SysOrg> getSysPowerRole(@RequestParam(value="oid",required=false)int oid){
		List<SysRole> srlist=sps.getSysPowerRole(oid);
		SysOrg sOrg1 =new SysOrg(9999, 0, "角色信息",true,true);
		List<SysOrg> soList = new ArrayList<SysOrg>();
		soList.add(sOrg1);
		for(SysRole sr:srlist) {
			SysOrg sOrg =new SysOrg();
			sOrg.setId(sr.getRid());
			sOrg.setName(sr.getRname());
			sOrg.setpId(9999);

			soList.add(sOrg);
		}
		return soList;
	}

	//根据角色信息获取角色的权限
	@RequestMapping("syspower")
	@ResponseBody
	public List<SysResource> getSysPower(@RequestParam(value="rid",required=false)int rid){
		return sps.getSysPower(rid);
	}

	//获取所有的资源列表
	@RequestMapping("sysresource")
	@ResponseBody
	public List<SysResource> getSysResource(){
		List<SysResource> srlist= sps.getSysResource();
		return srlist;

	}

}
