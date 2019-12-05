package com.se.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.se.dao.pojo.SysUser;
import com.se.service.SysUserService;
import com.se.util.DataTablePage;
import com.se.util.GetIpConfig;
import com.se.vo.SysOrg;
import com.se.vo.SysUserOut;

@Controller
@RequestMapping("/system/")
public class SysUserController {
	@Autowired
	private SysUserService sos;


	//查询组织结构树
	@RequestMapping("sysorg")
	@ResponseBody
	public List<SysOrg> getSysorg(@RequestParam(value="id",required=false)Integer ojigouid){
		System.out.println(ojigouid);
		if(ojigouid==null) {
			ojigouid=0;
		}
		List<SysOrg> sss= sos.getSysOrg(ojigouid);

		return sss;

	}



	//查询点击的组织结构树下的人员信息
	@RequestMapping("sysorgour")
	@ResponseBody
	public DataTablePage<SysUserOut> getSysorgour(@RequestParam(value="bianma",required=false)String bianma,
												  @RequestParam(value="start",required=false)String start,
												  @RequestParam(value="length",required=false)String length,
												  @RequestParam(value="draw",required=false)String draw){

		//获取总记录条数
		int count=sos.getSysorgusercount(bianma, start, length);

		List<SysUserOut> listsUsers=sos.getSysorguser(bianma,start,length);
		DataTablePage<SysUserOut> dtp = new DataTablePage<SysUserOut>();
		dtp.setData(listsUsers);
		dtp.setDraw(Integer.valueOf(draw));
		dtp.setRecordsFiltered(count);
		dtp.setRecordsTotal(count);
		return dtp;
	}

	//修改用户信息
	@RequestMapping("systemUser")
	@ResponseBody
	public SysUser updateUser(SysUser sUser){
		SysUser suupdate =sos.updateUser(sUser);
		return suupdate;

	}

	//删除用户信息
	@RequestMapping("deleteOrgUser")
	@ResponseBody
	public boolean deleteUser(@RequestParam(value="uid")int uid){
		boolean b=sos.deleteUser(uid);
		return b;
	}

	//新增用户信息
	@RequestMapping("addOrgUser")
	@ResponseBody
	public SysUser addUser(SysUser sUser,HttpServletRequest request){
		String ipconfig=GetIpConfig.getIpAddr(request);
		boolean b=sos.addUser(sUser,ipconfig);
		if(b) {
			return sUser;
		}else {
			return null;
		}

	}

	//批量删除用户信息
	@RequestMapping("deleteBatchOrgUser")
	@ResponseBody
	public boolean deleteBatchOrgUser(@RequestParam(value="idList[]",required=false)List<Integer> idList){
		System.out.println(idList.toString());
		return true;

	}

}
