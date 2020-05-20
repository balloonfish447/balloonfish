package com.se.service.impl;

import com.se.dao.ChanPinGuanLiDao;
import com.se.dao.pojo.*;
import com.se.service.ChanPinGuanLiService;

import com.se.util.DataTablePage;
import com.se.vo.SysUserOut;
import com.se.vo.SysteamOut;
import com.se.vo.applicationOut;
import com.se.vo.sixinOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChanPinGuanLiServiceImpl implements ChanPinGuanLiService {
    @Autowired
    private ChanPinGuanLiDao chanPinGuanLiDao;

    @Override
    public List<SysTeam> getRuKuInfos(String start, String length, String orderColumn, String orderdir,int userided) {
        return chanPinGuanLiDao.getRuKuInfos( start, length,orderColumn,orderdir,userided);
    }

    @Override
    public int getChanPinGuanLiCount(int userided) {
        return chanPinGuanLiDao.getChanPinGuanLiCount(userided);
    }

    @Override
    public int getTeamguanliCount(int userided){
        return chanPinGuanLiDao.getTeamguanliCount(userided);
    }
    @Override
    public List<SysTeam> getTeamInfos(String start, String length, String orderColumn, String orderdir,int userided){
        return chanPinGuanLiDao.getTeamInfos( start, length,orderColumn,orderdir,userided);
    }
//    @Override
//    public boolean addRuKuXinXi(RukuguanliEntity rkgl) {
//        return chanPinGuanLiDao.addRuKuXinXi(rkgl);
//    }
//
//    //修改入库信息
//    public RukuguanliEntity updateRuKuXinXi(RukuguanliEntity rkgl){
//        return chanPinGuanLiDao.updateRuKuXinXi(rkgl);
//    }
//
//    //入库管理
//    //批量修改银价
//    public  boolean updateYinJiaQuanBu(String currentyinjia){
//        return chanPinGuanLiDao.updateYinJiaQuanBu(currentyinjia);
//    }
//
//    @Override
//    //入库管理
//    //删除入库信息
    public boolean deleteTeamXinXi(int tid,int userided) {
        return chanPinGuanLiDao.deleteTeamXinXi(tid,userided);
    }
//
//    //出库管理
//    //添加出库信息
//    public boolean saveChuKuXinXi(ChukuguanliEntity ckgl){
//        return chanPinGuanLiDao.saveChuKuXinXi(ckgl);
//    }
//
//    //出库管理
//    //查看出库的详细信息
    public List<SysUserOut> getTeamxiangqing(String tid){
        return chanPinGuanLiDao.getTeamxiangqing(tid);
    }

    //入社申请

    @Override
    public boolean addteamshenqing(int tid, int userided) {
        return chanPinGuanLiDao.addteamshenqing(tid,userided);
    }

    @Override
    public List<applicationOut> getapplication(int userided) {
        return chanPinGuanLiDao.getapplication(userided);
    }

    public List<SysTeam> getallteams(){
        return chanPinGuanLiDao.getallteams();
    }

    @Override
    public List<SysteamOut> getadminallteams() {
        return chanPinGuanLiDao.getadminallteams();
    }

    @Override
    public boolean deleteteam(int tid) {
        return chanPinGuanLiDao.deleteteam(tid);
    }

    @Override
    public List<Discuss> alldiscuss(){
        return chanPinGuanLiDao.alldiscuss();
    }
    @Override
    public List<sixinOut> allsixin(){
        return chanPinGuanLiDao.allsixin();
    }
    @Override
    public boolean deletediscuss(int id){
        return chanPinGuanLiDao.deletediscuss(id);
    }
    @Override
    public boolean deletesixin(int id){
        return chanPinGuanLiDao.deletesixin(id);
    }


    //
//    //出库管理
//    //获取出库信息的总记录条数
//    public int getChuKuXinXiCount(){
//        return chanPinGuanLiDao.getChuKuXinXiCount();
//    }
//
//    //出库管理
//    //查看出库的详细信息--所有信息
//    public DataTablePage<ChukuguanliEntity> getChuKuXinXi(String start, String length, String orderColumn, String orderdir
//            , String chukuren, String dailishang, String chukushijianstart, String chukushijianend){
//        return chanPinGuanLiDao.getChuKuXinXi( start, length, orderColumn, orderdir
//                , chukuren, dailishang, chukushijianstart, chukushijianend);
//    }
//
//    //出库管理
//    //修改出库管理信息
//    public ChukuguanliEntity updateChukuxinxi(ChukuguanliEntity ckgl){
//        return chanPinGuanLiDao.updateChukuxinxi(ckgl);
//    }
//
//    //入库管理
//    //获取要生成excel的数据
//    public List<RukuguanliEntity> getRukuInfoChecked(String idList){
//        return chanPinGuanLiDao.getRukuInfoChecked(idList);
//    }
//
//    //出库管理
//    //获取要生成excel的数据
//    public List<ChukuguanliEntity>getChukuInfoChecked(String idList){
//        return chanPinGuanLiDao.getChukuInfoChecked(idList);
//    }
}
