package com.se.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.se.dao.pojo.*;
import com.se.service.SysRoleService;
import com.se.vo.sixinOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	//查询人员信息：不开启服务器端分页
	@RequestMapping("sysalluser")
	@ResponseBody
	public List<SysUserOut> getallUser(){
		return sos.getalluser();
	}

	@RequestMapping("getecharts")
	@ResponseBody
	public Map<String,Object> getecharts(){
		return sos.getecharts();
	}

	//查询评论信息
	@RequestMapping("getdiscuss")
	@ResponseBody
	public List<Discuss> getdiscuss(){
		return sos.getdiscuss();
	}

	@RequestMapping("getgonggao")
	@ResponseBody
	public Notice getnotice(){
		return sos.getnotice();
	}

	//新增评论
	@RequestMapping("addpinglun")
	@ResponseBody
	public boolean addpinglun(@RequestParam(value="text")String text,HttpServletRequest request){
		SysUser su=(SysUser)request.getSession().getAttribute("USERINFO");
		//获取用户ID
		int userided=su.getUid();
		return sos.addpinglun(text,userided);
	}

	//新增评论
	@RequestMapping("addgonggao")
	@ResponseBody
	public boolean addgonggao(@RequestParam(value="text")String text){
		//我要获取当前的日期
		Date date = new Date();
		//设置要获取到什么样的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//获取String类型的时间
		String createdate = sdf.format(date);
		Notice notice=new Notice();
		notice.setText(text);
		notice.setTime(createdate);
		return sos.addgonggao(notice);

	}

	//新增私信
	@RequestMapping("addsixin")
	@ResponseBody
	public boolean addsixin(@RequestParam(value="text")String text,HttpServletRequest request){
		SysUser su=(SysUser)request.getSession().getAttribute("USERINFO");
		//获取用户ID
		int userided=su.getUid();
		return sos.addsixin(text,userided);
	}
	@RequestMapping("getletters")
	@ResponseBody
	public List<sixinOut> getallsixin(){
		return sos.getallsixin();
	}
	@RequestMapping("getpingluns")
	@ResponseBody
	public List<sixinOut> getallpinglun(){
		return sos.getallpinglun();
	}

	//修改用户信息
	@RequestMapping("systemUser")
	@ResponseBody
	public SysUserOut updateUser(SysUser sUser){
		SysUserOut suupdate =sos.updateUser(sUser);
		return suupdate;

	}
	//修改社团信息
	@RequestMapping("updateteam")
	@ResponseBody
	public boolean updateTeam(SysTeam steam){
		return sos.updateTeam(steam);
	}

	//新增社团
	@RequestMapping("addteam")
	@ResponseBody
	public boolean addteam(SysTeam team){
		return sos.addteam(team);
	}

	//删除用户信息
	@RequestMapping("deleteOrgUser")
	@ResponseBody
	public boolean deleteUser(@RequestParam(value="uid")int uid){
		boolean b=sos.deleteUser(uid);
		return b;
	}

	//获取用户详细信息
	@RequestMapping("getuserinfos")
	@ResponseBody
	public SysUserInformation getuserinfos(@RequestParam(value="uid")int uid){
		SysUserInformation user=sos.getuserinfos(uid);
		if(user==null){
			return null;
		}
		return user;
	}

	//获取社团详细信息
	@RequestMapping("getteaminfos")
	@ResponseBody
	public SysTeamInformation getteaminfos(@RequestParam(value="tid")int tid){
		SysTeamInformation team=sos.getteaminfos(tid);
		if(team==null){
			return null;
		}
		return team;
	}

	//删除管理社团的用户
	@RequestMapping("deleteteamuser")
	@ResponseBody
	public boolean deleteTeamuser(@RequestParam(value = "tid")int tid,@RequestParam(value = "uid")int uid){
		boolean y=sos.deleteTeamuser(tid,uid);
		return y;
	}

	//删除入社申请
	@RequestMapping("deleteapplication")
	@ResponseBody
	public boolean deleteapplication(@RequestParam(value = "id")int id){
		return sos.deleteapplication(id);
	}

	//同意申请
	@RequestMapping("tongyishenqing")
	@ResponseBody
	public boolean addtongyi(@RequestParam(value = "id")int id,@RequestParam(value = "uid")int uid,
						  @RequestParam(value = "tid")int tid){

		return sos.addtongyi(id,uid,tid);
	}


	//新增用户信息
	@RequestMapping("addOrgUser")
	@ResponseBody
	public boolean addUser(SysUser sUser,HttpServletRequest request){
		String ipconfig=GetIpConfig.getIpAddr(request);
		boolean b=sos.addUser(sUser,ipconfig);
		return b;

	}

	//注册用户信息
    @RequestMapping("zhuceUser")
    @ResponseBody
    public boolean zhuceUser(SysUser suser){
	    boolean b=sos.zhuceUser(suser);
	    return b;
    }

    @RequestMapping("checkphone/login")
    public void phoneyanzheng(String checkphone,String flag, HttpServletResponse response) throws IOException{
        boolean a=sos.phoneyanzheng(checkphone);
        response.setContentType("application/json");
        if(a){

            response.getWriter().write("{\"valid\":true}");

        }else{

            response.getWriter().write("{\"valid\":false}");
        }



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
            response.setContentType("application/json");
			response.getWriter().write("{\"valid\":true}");

		}else{
            response.setContentType("application/json");
			response.getWriter().write("{\"valid\":false}");
		}

	}

}
