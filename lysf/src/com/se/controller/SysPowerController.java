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

	//构建角色信息列表
	@RequestMapping("syspowerrole")
	@ResponseBody
	public List<SysRole> getSysPowerRole(){
		List<SysRole> srlist=sps.getSysPowerRole();


		return srlist;
	}

	//保存角色选择的权限
	@RequestMapping("savepower")
	@ResponseBody
	public boolean saveSysPower(@RequestParam(value="rid",required=false)int rid,
								@RequestParam(value = "reids",required = false)Integer[] reids){
		return sps.saveSysPower(rid,reids);
	}

	//构建资源组织结构树
    @RequestMapping("sysresoucetree")
    @ResponseBody
    public List<SysOrg> getSysResourceTree(@RequestParam(value="rid",required=false)int rid){
        return sps.getSysResourceTree(rid);
    }

}
