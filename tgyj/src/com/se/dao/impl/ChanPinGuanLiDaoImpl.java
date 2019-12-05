package com.se.dao.impl;

import com.se.dao.ChanPinGuanLiDao;
import com.se.dao.pojo.ChukuguanliEntity;
import com.se.dao.pojo.RukuguanliEntity;
import com.se.dao.pojo.SysUser;
import com.se.util.DataTablePage;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class ChanPinGuanLiDaoImpl implements ChanPinGuanLiDao {

    @Autowired
    private SessionFactory sf;

    public Session getSession() {
        return sf.getCurrentSession();
    }
    @Override
    //入库管理
    //获取入库的信息列表
    public List<RukuguanliEntity> getRuKuInfos(String start,String length,String orderColumn,String orderdir) {
        String hql="from RukuguanliEntity order by rukushijian desc";
        if((orderColumn!=null&&!orderColumn.equals(""))&&(orderdir!=null&&!orderdir.equals(""))){

            if(!orderColumn.equals("rukushijian")){
                hql="from RukuguanliEntity order by " +orderColumn+ " " +orderdir;
            }else{
                hql="from RukuguanliEntity order by "+orderColumn+" " +orderdir;
            }
        }


        Query query = getSession().createQuery(hql);
        //Hibernate分页
        query.setFirstResult(Integer.valueOf(start));
        query.setMaxResults(Integer.valueOf(length));
        List<RukuguanliEntity> rkinfos = query.list();
        return rkinfos;
    }

    //获取入库信息总的记录条数
    public int getChanPinGuanLiCount() {
        String hql="select count(*) from RukuguanliEntity ";
        Query query = getSession().createQuery(hql);
        Number sus =(Number) query.uniqueResult();
        return sus.intValue();
    }

    //添加入库信息
    public boolean addRuKuXinXi(RukuguanliEntity rkgl){
        rkgl.setRukushijian(new Date());
        //可否出库的值默认为0，出库后累计增加改值，表示已经出库的量
        rkgl.setKefouchuku("0");
        getSession().save(rkgl);
        return  true;
    }

    //修改入库信息
    public RukuguanliEntity updateRuKuXinXi(RukuguanliEntity rkgl){

        getSession().update(rkgl);
        getSession().flush();

        return  rkgl;
    }

    //入库管理
    //批量修改银价
    public  boolean updateYinJiaQuanBu(String currentyinjia){
        if(currentyinjia!=null&&!currentyinjia.equals("")){
            String sql = "update rukuguanli set yinjia = "+currentyinjia;
            Query query=getSession().createSQLQuery(sql);
            query.executeUpdate();
            return true;
        }else{
            return false;
        }

    }
    @Override
    //入库管理
    //删除入库管理信息
    public boolean deleteRuKuXinXi(int rkid) {
        String hql= "from RukuguanliEntity where rkid=?";
        Query query = getSession().createQuery(hql);
        query.setInteger(0, rkid);
        RukuguanliEntity rukuguanliEntity=(RukuguanliEntity) query.uniqueResult();
        getSession().delete(rukuguanliEntity);
        return true;
    }


    //出库管理
    //添加出库信息
    public boolean saveChuKuXinXi(ChukuguanliEntity ckgl){
        //设置出库时间
        ckgl.setChukushijian(new Date());
        getSession().save(ckgl);
        //更改入库记录中，可否出库的值，可否出库的值=出库银克重的和
        RukuguanliEntity rkgl= (RukuguanliEntity) getSession().get(RukuguanliEntity.class,ckgl.getRkid());
        BigDecimal oddkfck=new BigDecimal(rkgl.getKefouchuku().toString());
        BigDecimal newkfck=new BigDecimal(ckgl.getYinkezhong().toString());
        rkgl.setKefouchuku(oddkfck.add(newkfck).toString());
        getSession().update(rkgl);
        return true;
    }

    //出库管理
    //查看出库的详细信息---for -rkid
    public  List<ChukuguanliEntity> getChuKuXinXiinfo(String rkid){
        StringBuilder hql= new StringBuilder("from ChukuguanliEntity where 1=1 ");
        if(rkid!=null && !rkid.equals("")){
            hql.append(" and rkid=:rkid");
        }
        Query query =getSession().createQuery(hql.toString());
        if(rkid!=null && !rkid.equals("")){
            query.setInteger("rkid",Integer.valueOf(rkid));
        }
        List<ChukuguanliEntity> ckgllists=query.list();
        return ckgllists;

    }

    //出库管理
    //获取出库信息的总记录条数
    public int getChuKuXinXiCount(){
        String hql="select count(*) from ChukuguanliEntity ";
        Query query = getSession().createQuery(hql);
        Number sus =(Number) query.uniqueResult();
        return sus.intValue();
    }

    //出库管理
    //查看出库的详细信息--包含检索条件
    public DataTablePage<ChukuguanliEntity> getChuKuXinXi(String start, String length, String orderColumn, String orderdir
            , String chukuren, String dailishang, String chukushijianstart, String chukushijianend){
        StringBuilder hql=new StringBuilder("from ChukuguanliEntity order where 1=1 " );
        StringBuilder hqlsum=new StringBuilder("select ROUND(sum(ckgl.jiagongfeizongji),2)as ckjgfzj," +
                "ROUND(sum(rkgl.jiagongfeizongji),2)as rkjgfzj," +
                "ROUND(sum(ckgl.jiagongfeizongji-rkgl.jiagongfeizongji),2)as lirunsum " +
                "from chukuguanli as ckgl " +
                "left join rukuguanli as rkgl on 1 =1 ");

        if(chukuren!=null&&!chukuren.equals("")){
           hql.append(" and chukuren=:chukuren");
            hqlsum.append(" and chukuren=:chukuren");
        }
        if(dailishang!=null&&!dailishang.equals("")){
            hql.append(" and dailishang=:dailishang");
            hqlsum.append(" and dailishang=:dailishang");
        }
        if((chukushijianstart!=null&&!chukushijianstart.equals(""))&&(chukushijianend!=null&&!chukushijianend.equals(""))){
            hql.append(" and chukushijian between :chukushijianstart and :chukushijianend");
            hqlsum.append(" and chukushijian between :chukushijianstart and :chukushijianend");
        }

        if((orderColumn!=null&&!orderColumn.equals(""))&&(orderdir!=null&&!orderdir.equals(""))){
            hql.append(" order by " +orderColumn+ " " +orderdir);
        }
        Query query = getSession().createQuery(hql.toString());
        Query query1 =getSession().createSQLQuery(hqlsum.toString());
        //设置参数值
        if(chukuren!=null&&!chukuren.equals("")){
           query.setString("chukuren",chukuren);
            query1.setString("chukuren",chukuren);
        }
        if(dailishang!=null&&!dailishang.equals("")){
            query.setString("dailishang",dailishang);
            query1.setString("dailishang",dailishang);
        }
        if((chukushijianstart!=null&&!chukushijianstart.equals(""))&&(chukushijianend!=null&&!chukushijianend.equals(""))){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");

            try {
                query.setDate("chukushijianstart",sdf.parse(chukushijianstart));
                query.setDate("chukushijianend",sdf.parse(chukushijianend));
                query1.setDate("chukushijianstart",sdf.parse(chukushijianstart));
                query1.setDate("chukushijianend",sdf.parse(chukushijianend));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }


        //Hibernate分页
        query.setFirstResult(Integer.valueOf(start));
        query.setMaxResults(Integer.valueOf(length));
        List<ChukuguanliEntity> ckinfos = query.list();
        List<Object[]> liruns = query1.list();


        DataTablePage<ChukuguanliEntity> ckgl= new DataTablePage<ChukuguanliEntity>();
        ckgl.setData(ckinfos);
        if(liruns!=null&&liruns.size()>0){
            ckgl.setCkjgfzj(liruns.get(0)[0].toString());
            ckgl.setRkjgfzj(liruns.get(0)[1].toString());
            ckgl.setLirun(liruns.get(0)[2].toString());
        }


        return ckgl;
    }

    //出库管理
    //修改出库管理信息
    public ChukuguanliEntity updateChukuxinxi(ChukuguanliEntity ckgl){
        getSession().update(ckgl);
        getSession().flush();

        return  ckgl;
    }

    //入库管理
    //获取要生成excel的数据
    public List<RukuguanliEntity> getRukuInfoChecked(String idList){
        String rkid[]=idList.split(",");
        //如果第一个值等于all，表示要导出所有数据
        if(rkid[0].equals("all")){
                String hql="from RukuguanliEntity";
                Query query=getSession().createQuery(hql);
                return query.list();
        }else{
                List<Integer> rkids= new ArrayList<Integer>();
                for(String rk:rkid){
                    rkids.add(Integer.valueOf(rk));
                }
                String hql="from RukuguanliEntity where rkid in (:idList)";
                Query query=getSession().createQuery(hql);
                query.setParameterList("idList",rkids);
                return query.list();
         }
    }

    //出库管理
    //获取要生成excel的数据
    public List<ChukuguanliEntity>getChukuInfoChecked(String idList){
        String rkid[]=idList.split(",");
        //如果第一个值等于all，表示要导出所有数据
        if(rkid[0].equals("all")){
            String hql="from ChukuguanliEntity";
            Query query=getSession().createQuery(hql);
            return query.list();
        }else{
            List<Integer> rkids= new ArrayList<Integer>();
            for(String rk:rkid){
                rkids.add(Integer.valueOf(rk));
            }
            String hql="from ChukuguanliEntity where ckid in (:idList)";
            Query query=getSession().createQuery(hql);
            query.setParameterList("idList",rkids);
            return query.list();
        }
    }

}
