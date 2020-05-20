package com.se.service;

import com.se.dao.ChanPinGuanLiDao;
import com.se.dao.pojo.*;
import com.se.util.DataTablePage;
import com.se.vo.SysUserOut;
import com.se.vo.SysteamOut;
import com.se.vo.applicationOut;
import com.se.vo.sixinOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


public interface ChanPinGuanLiService {

    //入库管理
    //获取入库的信息列表
    public List<SysTeam> getRuKuInfos(String start, String length, String orderColumn, String orderdir,int userided);

    //获取信息总的记录条数
    public int getChanPinGuanLiCount(int userided);
    //获取管理社团数量
    public int getTeamguanliCount(int userided);
    public List<SysTeam> getTeamInfos(String start, String length, String orderColumn, String orderdir,int userided);

//    //添加入库信息
//    public boolean addRuKuXinXi(RukuguanliEntity rkgl);
//
//    //修改入库信息
//    public RukuguanliEntity updateRuKuXinXi(RukuguanliEntity rkgl);
//
//    //入库管理
//    //批量修改银价
//    public  boolean updateYinJiaQuanBu(String currentyinjia);
//
//    //入库管理
//    //删除入库信息
  public boolean deleteTeamXinXi(int tid,int userided);
//
//    //出库管理
//    //添加出库信息
//    public boolean saveChuKuXinXi(ChukuguanliEntity ckgl);
//
    //出库管理
    //查看出库的详细信息for rkid
    public List<SysUserOut> getTeamxiangqing(String  tid);

    public boolean addteamshenqing(int tid,int userided);

    public List<applicationOut> getapplication(int userided);

    public List<SysTeam> getallteams();

    public List<SysteamOut> getadminallteams();

    public boolean deleteteam(int tid);

    public List<Discuss> alldiscuss();
    public List<sixinOut> allsixin();
    public boolean deletediscuss(int id);
    public boolean deletesixin(int id);

//    //出库管理
//    //获取出库信息的总记录条数
//    public int getChuKuXinXiCount();
//
//    //出库管理
//    //查看出库的详细信息--所有信息
//    public DataTablePage<ChukuguanliEntity> getChuKuXinXi(String start, String length, String orderColumn, String orderdir
//            , String chukuren, String dailishang, String chukushijianstart, String chukushijianend);
//
//    //出库管理
//    //修改出库管理信息
//    public ChukuguanliEntity updateChukuxinxi(ChukuguanliEntity ckgl);
//
//    //入库管理
//    //获取要生成excel的数据
//    public List<RukuguanliEntity>getRukuInfoChecked(String idList);
//
//    //出库管理
//    //获取要生成excel的数据
//    public List<ChukuguanliEntity>getChukuInfoChecked(String idList);

}
