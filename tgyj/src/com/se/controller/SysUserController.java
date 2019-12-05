package com.se.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.se.dao.pojo.SysRole;
import com.se.service.SysRoleService;
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



	//查询人员信息
	@RequestMapping("sysorgour")
	@ResponseBody
	public DataTablePage<SysUserOut> getSysorgour(
												  @RequestParam(value="start",required=false)String start,
												  @RequestParam(value="length",required=false)String length,
												  @RequestParam(value="draw",required=false)String draw){

		//获取总记录条数
		int count=sos.getSysorgusercount(start, length);
		//获取用户的详细信息列表
		List<SysUserOut> listsUsers=sos.getSysorguser(start,length);
		//转换成datatable格式
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
	public SysUserOut updateUser(SysUser sUser){
		SysUserOut suupdate =sos.updateUser(sUser);
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
	public boolean addUser(SysUser sUser,HttpServletRequest request){
		String ipconfig=GetIpConfig.getIpAddr(request);
		boolean b=sos.addUser(sUser,ipconfig);
		return b;

	}

	//批量删除用户信息
	@RequestMapping("deleteBatchOrgUser")
	@ResponseBody
	public boolean deleteBatchOrgUser(@RequestParam(value="idList[]",required=false)List<Integer> uidList){
		return sos.deleteBatchOrgUser(uidList);


	}

	//验证手机号是否存在
	@RequestMapping("checkphone")

	public void checkPhone(String checkphone,String flag, HttpServletResponse response) throws IOException {
		boolean b=sos.checkPhone(checkphone,flag);

		ObjectMapper mapper = new ObjectMapper();


		if(b){
			response.getWriter().write("{\"valid\":true}");

		}else{
			response.getWriter().write("{\"valid\":false}");
		}

	}

}
