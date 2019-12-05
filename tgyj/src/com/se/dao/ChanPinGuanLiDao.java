package com.se.dao;

import com.se.dao.pojo.ChukuguanliEntity;
import com.se.dao.pojo.RukuguanliEntity;
import com.se.util.DataTablePage;

import java.util.List;

public interface ChanPinGuanLiDao {

    //入库管理
    //获取入库的信息列表
    public List<RukuguanliEntity> getRuKuInfos(String start,String length,String orderColumn,String orderdir);

    //获取用户总的记录条数
    public int getChanPinGuanLiCount();

    //添加入库信息
    public boolean addRuKuXinXi(RukuguanliEntity rkgl);

    //修改入库信息
    public RukuguanliEntity updateRuKuXinXi(RukuguanliEntity rkgl);

    //入库管理
    //批量修改银价
    public  boolean updateYinJiaQuanBu(String currentyinjia);

    //入库管理
    //删除入库信息
    public boolean deleteRuKuXinXi(int rkid);

    //出库管理
    //添加出库信息
    public boolean saveChuKuXinXi(ChukuguanliEntity ckgl);

    //出库管理
    //查看出库的详细信息
    public  List<ChukuguanliEntity> getChuKuXinXiinfo(String rkid);

    //出库管理
    //获取出库信息的总记录条数
    public int getChuKuXinXiCount();

    //出库管理
    //查看出库的详细信息--所有信息
    public DataTablePage<ChukuguanliEntity> getChuKuXinXi(String start, String length, String orderColumn, String orderdir
            , String chukuren, String dailishang, String chukushijianstart, String chukushijianend);

    //出库管理
    //修改出库管理信息
    public ChukuguanliEntity updateChukuxinxi(ChukuguanliEntity ckgl);

    //入库管理
    //获取要生成excel的数据
    public List<RukuguanliEntity> getRukuInfoChecked(String idList);

    //出库管理
    //获取要生成excel的数据
    public List<ChukuguanliEntity>getChukuInfoChecked(String idList);
}
