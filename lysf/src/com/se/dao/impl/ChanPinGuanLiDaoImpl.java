package com.se.dao.impl;

import com.se.dao.ChanPinGuanLiDao;
import com.se.dao.pojo.*;
import com.se.util.DataTablePage;
import com.se.vo.SysUserOut;
import com.se.vo.SysteamOut;
import com.se.vo.applicationOut;
import com.se.vo.sixinOut;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;
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
    public List<SysTeam> getRuKuInfos(String start, String length, String orderColumn, String orderdir,int userided) {
       String hql1="select tid from SysUserTeam where uid=:userid";
        Query query1 = getSession().createQuery(hql1);
        query1.setInteger("userid",userided);
        List tids=query1.list();

        String hql="from SysTeam where tid in (:tids) order by " +orderColumn+ " " +orderdir;
        //String hql="from SysUserEntity order by "+ordercolumn +" "+ orderdir;
        Query query = getSession().createQuery(hql);
        query.setParameterList("tids",tids);
        //Hibernate分页
        query.setFirstResult(Integer.valueOf(start));
        query.setMaxResults(Integer.valueOf(length));
        List<SysTeam> rkinfos = query.list();
        return rkinfos;
    }

    //获取入库信息总的记录条数
    public int getChanPinGuanLiCount(int userided) {
        String hql="select count(*) from SysUserTeam where uid=:userid ";
        Query query = getSession().createQuery(hql);
        query.setInteger("userid",userided);
        Number sus =(Number) query.uniqueResult();
        return sus.intValue();
    }

    public int getTeamguanliCount(int userided){
        String hql="select count(*) from SysTeam where uid=:userid ";
        Query query = getSession().createQuery(hql);
        query.setInteger("userid",userided);
        Number sus =(Number) query.uniqueResult();
        return sus.intValue();
    }

    public List<SysTeam> getTeamInfos(String start, String length, String orderColumn, String orderdir,int userided){
        String hql="from SysTeam where uid =:userid order by " +orderColumn+ " " +orderdir;
        //String hql="from SysUserEntity order by "+ordercolumn +" "+ orderdir;
        Query query = getSession().createQuery(hql);
        query.setInteger("userid",userided);
        //Hibernate分页
        query.setFirstResult(Integer.valueOf(start));
        query.setMaxResults(Integer.valueOf(length));
        List<SysTeam> Teaminfos = query.list();
        return Teaminfos;
    }

//    //添加入库信息
//    public boolean addRuKuXinXi(RukuguanliEntity rkgl){
//        rkgl.setRukushijian(new Date());
//        //可否出库的值默认为0，出库后累计增加改值，表示已经出库的量
//        rkgl.setKefouchuku("0");
//        getSession().save(rkgl);
//        return  true;
//    }
//
//    //修改入库信息
//    public RukuguanliEntity updateRuKuXinXi(RukuguanliEntity rkgl){
//
//        getSession().update(rkgl);
//        getSession().flush();
//
//        return  rkgl;
//    }
//
//    //入库管理
//    //批量修改银价
//    public  boolean updateYinJiaQuanBu(String currentyinjia){
//        if(currentyinjia!=null&&!currentyinjia.equals("")){
//            String sql = "update rukuguanli set yinjia = "+currentyinjia;
//            Query query=getSession().createSQLQuery(sql);
//            query.executeUpdate();
//            return true;
//        }else{
//            return false;
//        }
//
//    }
//    @Override

    //删除社团信息
    public boolean deleteTeamXinXi(int tid,int userided) {
        String hql= "from SysUserTeam where tid=? and uid=?";
        Query query = getSession().createQuery(hql);
        query.setInteger(0, tid);
        query.setInteger(1, userided);
        SysUserTeam user_team=(SysUserTeam) query.uniqueResult();
        getSession().delete(user_team);
        return true;
    }
//
//
//    //出库管理
//    //添加出库信息
//    public boolean saveChuKuXinXi(ChukuguanliEntity ckgl){
//        //设置出库时间
//        ckgl.setChukushijian(new Date());
//        getSession().save(ckgl);
//        //更改入库记录中，可否出库的值，可否出库的值=出库银克重的和
//        RukuguanliEntity rkgl= (RukuguanliEntity) getSession().get(RukuguanliEntity.class,ckgl.getRkid());
//        BigDecimal oddkfck=new BigDecimal(rkgl.getKefouchuku().toString());
//        BigDecimal newkfck=new BigDecimal(ckgl.getYinkezhong().toString());
//        rkgl.setKefouchuku(oddkfck.add(newkfck).toString());
//        getSession().update(rkgl);
//        return true;
//    }
//
//    //出库管理
//    //查看社团的详细信息---for -rkid
    public List<SysUserOut> getTeamxiangqing(String tid){
        String hql1="select uid from SysUserTeam where tid=:teamid";
        Query query = getSession().createQuery(hql1);
        query.setInteger("teamid",Integer.valueOf(tid));
        List uids=query.list();
        String userids=uids.toString();
        String uidss=userids.substring(1,userids.length()-1);


       //System.out.println(uids.toString());
        String sql="select su.uid,su.sno,su.username,su.password,"
                + "su.email,su.phone,"
                + "sr.rname "
                + "from sys_user as su left join sys_role as sr on su.roleid=sr.rid "
                + "where su.uid in ("+uidss+")";

        Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysUserOut.class));
//        Query query1 = getSession().createSQLQuery(sql);
//        query1.setParameterList("userids",uids);
//        query1=query1.setResultTransformer(Transformers.aliasToBean(SysUserOut.class));
        List<SysUserOut> teamxiangqinglists=query1.list();
        return teamxiangqinglists;

    }

  //add入社申请
    @Override
    public boolean addteamshenqing(int tid, int userided) {

        String hql1="from SysApplication where tid=:teamid and uid=:userid";
        Query query = getSession().createQuery(hql1);
        query.setInteger("teamid",tid);
        query.setInteger("userid",userided);
        List apps=query.list();
        if(apps.size()>0){
            return false;
        }
        SysApplication application=new SysApplication();
        application.setTid(tid);
        application.setUid(userided);
        getSession().save(application);
        return true;
    }

    //获取入社申请
    @Override
    public List<applicationOut> getapplication(int userided) {
        String hql1="from SysTeam where uid=:userid";
        Query query = getSession().createQuery(hql1);
        query.setInteger("userid",userided);
       SysTeam team= (SysTeam) query.uniqueResult();



        String sql="select au.id,au.username,au.uid,t.tname,t.tid from sys_team t left join " +
                "(select a.id,a.tid,u.username,u.uid from sys_application a left join sys_user u on a.uid=u.uid) au " +
                "on t.tid=au.tid";
        Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(applicationOut.class));
        List<applicationOut> applicationOuts=query1.list();
        List<applicationOut> apps=new ArrayList<>();
       for (applicationOut app:applicationOuts) {
            if(app.getTid()==team.getTid())
                apps.add(app);
        }

        return apps;
    }

    public List<SysTeam> getallteams(){
        String hql1="from SysTeam";
        Query query = getSession().createQuery(hql1);
        List<SysTeam> allteams=query.list();
        return allteams;

    }

    public List<SysteamOut> getadminallteams(){
        String sql="select t.*,u.username from sys_team t left join sys_user u on t.uid=u.uid";
        Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(SysteamOut.class));
        List<SysteamOut> teams=query1.list();
        return teams;
    }

    @Override
    public boolean deleteteam(int tid) {
        String hql= "from SysTeam where tid=?";
        Query query = getSession().createQuery(hql);
        query.setInteger(0, tid);
        SysTeam team=(SysTeam) query.uniqueResult();
        getSession().delete(team);
        return true;
    }
    @Override
    public List<Discuss> alldiscuss(){
        String hql="from Discuss";
        Query query=getSession().createQuery(hql);
        List<Discuss> dis=query.list();
        return dis;

    }
    @Override
    public List<sixinOut> allsixin(){
//        String hql="from Letter";
//        Query query=getSession().createQuery(hql);
//        List<Letter> dis=query.list();
//        return dis;
        String sql="select t.*,u.username from letter t left join sys_user u on t.uid=u.uid";
        Query query1 = getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(sixinOut.class));
        List<sixinOut> dis=query1.list();
        return dis;

    }

    @Override
    public boolean deletediscuss(int id) {
        String hql= "from Discuss where id=?";
        Query query = getSession().createQuery(hql);
        query.setInteger(0, id);
        Discuss dis=(Discuss) query.uniqueResult();
        getSession().delete(dis);
        return true;
    }

    @Override
    public boolean deletesixin(int id) {
        String hql= "from Letter where id=?";
        Query query = getSession().createQuery(hql);
        query.setInteger(0, id);
        Letter le=(Letter) query.uniqueResult();
        getSession().delete(le);
        return true;
    }

    //
//    //出库管理
//    //获取出库信息的总记录条数
//    public int getChuKuXinXiCount(){
//        String hql="select count(*) from ChukuguanliEntity ";
//        Query query = getSession().createQuery(hql);
//        Number sus =(Number) query.uniqueResult();
//        return sus.intValue();
//    }
//
//    //出库管理
//    //查看出库的详细信息--包含检索条件
//    public DataTablePage<ChukuguanliEntity> getChuKuXinXi(String start, String length, String orderColumn, String orderdir
//            , String chukuren, String dailishang, String chukushijianstart, String chukushijianend){
//        StringBuilder hql=new StringBuilder("from ChukuguanliEntity order where 1=1 " );
//        StringBuilder hqlsum=new StringBuilder("select ROUND(sum(ckgl.jiagongfeizongji),2)as ckjgfzj," +
//                "ROUND(sum(rkgl.jiagongfeizongji),2)as rkjgfzj," +
//                "ROUND(sum(ckgl.jiagongfeizongji-rkgl.jiagongfeizongji),2)as lirunsum " +
//                "from chukuguanli as ckgl " +
//                "left join rukuguanli as rkgl on 1 =1 ");
//
//        if(chukuren!=null&&!chukuren.equals("")){
//           hql.append(" and chukuren=:chukuren");
//            hqlsum.append(" and chukuren=:chukuren");
//        }
//        if(dailishang!=null&&!dailishang.equals("")){
//            hql.append(" and dailishang=:dailishang");
//            hqlsum.append(" and dailishang=:dailishang");
//        }
//        if((chukushijianstart!=null&&!chukushijianstart.equals(""))&&(chukushijianend!=null&&!chukushijianend.equals(""))){
//            hql.append(" and chukushijian between :chukushijianstart and :chukushijianend");
//            hqlsum.append(" and chukushijian between :chukushijianstart and :chukushijianend");
//        }
//
//        if((orderColumn!=null&&!orderColumn.equals(""))&&(orderdir!=null&&!orderdir.equals(""))){
//            hql.append(" order by " +orderColumn+ " " +orderdir);
//        }
//        Query query = getSession().createQuery(hql.toString());
//        Query query1 =getSession().createSQLQuery(hqlsum.toString());
//        //设置参数值
//        if(chukuren!=null&&!chukuren.equals("")){
//           query.setString("chukuren",chukuren);
//            query1.setString("chukuren",chukuren);
//        }
//        if(dailishang!=null&&!dailishang.equals("")){
//            query.setString("dailishang",dailishang);
//            query1.setString("dailishang",dailishang);
//        }
//        if((chukushijianstart!=null&&!chukushijianstart.equals(""))&&(chukushijianend!=null&&!chukushijianend.equals(""))){
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
//
//            try {
//                query.setDate("chukushijianstart",sdf.parse(chukushijianstart));
//                query.setDate("chukushijianend",sdf.parse(chukushijianend));
//                query1.setDate("chukushijianstart",sdf.parse(chukushijianstart));
//                query1.setDate("chukushijianend",sdf.parse(chukushijianend));
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }
//        }
//
//
//        //Hibernate分页
//        query.setFirstResult(Integer.valueOf(start));
//        query.setMaxResults(Integer.valueOf(length));
//        List<ChukuguanliEntity> ckinfos = query.list();
//        List<Object[]> liruns = query1.list();
//
//
//        DataTablePage<ChukuguanliEntity> ckgl= new DataTablePage<ChukuguanliEntity>();
//        ckgl.setData(ckinfos);
//        if(liruns!=null&&liruns.size()>0){
//            ckgl.setCkjgfzj(liruns.get(0)[0].toString());
//            ckgl.setRkjgfzj(liruns.get(0)[1].toString());
//            ckgl.setLirun(liruns.get(0)[2].toString());
//        }
//
//
//        return ckgl;
//    }
//
//    //出库管理
//    //修改出库管理信息
//    public ChukuguanliEntity updateChukuxinxi(ChukuguanliEntity ckgl){
//        getSession().update(ckgl);
//        getSession().flush();
//
//        return  ckgl;
//    }
//
//    //入库管理
//    //获取要生成excel的数据
//    public List<RukuguanliEntity> getRukuInfoChecked(String idList){
//        String rkid[]=idList.split(",");
//        //如果第一个值等于all，表示要导出所有数据
//        if(rkid[0].equals("all")){
//                String hql="from RukuguanliEntity";
//                Query query=getSession().createQuery(hql);
//                return query.list();
//        }else{
//                List<Integer> rkids= new ArrayList<Integer>();
//                for(String rk:rkid){
//                    rkids.add(Integer.valueOf(rk));
//                }
//                String hql="from RukuguanliEntity where rkid in (:idList)";
//                Query query=getSession().createQuery(hql);
//                query.setParameterList("idList",rkids);
//                return query.list();
//         }
//    }
//
//    //出库管理
//    //获取要生成excel的数据
//    public List<ChukuguanliEntity>getChukuInfoChecked(String idList){
//        String rkid[]=idList.split(",");
//        //如果第一个值等于all，表示要导出所有数据
//        if(rkid[0].equals("all")){
//            String hql="from ChukuguanliEntity";
//            Query query=getSession().createQuery(hql);
//            return query.list();
//        }else{
//            List<Integer> rkids= new ArrayList<Integer>();
//            for(String rk:rkid){
//                rkids.add(Integer.valueOf(rk));
//            }
//            String hql="from ChukuguanliEntity where ckid in (:idList)";
//            Query query=getSession().createQuery(hql);
//            query.setParameterList("idList",rkids);
//            return query.list();
//        }
//    }

}
