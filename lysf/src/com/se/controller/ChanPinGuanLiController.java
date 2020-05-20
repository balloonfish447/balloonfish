package com.se.controller;

import com.se.dao.pojo.*;
import com.se.service.ChanPinGuanLiService;
import com.se.util.DataTablePage;
import com.se.util.DownLoadExcel;
import com.se.util.ExcelUtil;
import com.se.vo.SysUserOut;
import com.se.vo.SysteamOut;
import com.se.vo.applicationOut;
import com.se.vo.sixinOut;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

@Controller()
@RequestMapping("/chanpinguanli/")
public class ChanPinGuanLiController {
    @Autowired
    private ChanPinGuanLiService chanPinGuanLiService;


    //社团管理
    //获取已加入社团的信息列表
    @RequestMapping("getrukuinfos")
    @ResponseBody
    public DataTablePage<SysTeam> getRuKuInfos(@RequestParam(value="start",required=false)String start,
                                               @RequestParam(value="length",required=false)String length,
                                               @RequestParam(value="draw",required=false)String draw,
                                               @RequestParam(value = "order[0][column]",required = false)String order,
                                               @RequestParam(value = "order[0][dir]",required = false)String orderdir,
                                               HttpServletRequest request){
        //获取当前用户
        SysUser su=(SysUser)request.getSession().getAttribute("USERINFO");
        //获取用户ID
        int userided=su.getUid();
        //获取总记录条数
        int count=chanPinGuanLiService.getChanPinGuanLiCount(userided);

        //获取排序信息
        String orderColumn = request.getParameter("columns["+order+"][data]");
        //获取入库信息详情
        List<SysTeam> rkgls= chanPinGuanLiService.getRuKuInfos(start,length,orderColumn,orderdir,userided);
        //转换成datatable格式
        DataTablePage<SysTeam> dtp = new DataTablePage<SysTeam>();
        dtp.setData(rkgls);
        dtp.setDraw(Integer.valueOf(draw));
        dtp.setRecordsFiltered(count);
        dtp.setRecordsTotal(count);
        return dtp;

    }


    //我管理的社团
    @RequestMapping("getguanliteams")
    @ResponseBody
    public DataTablePage<SysTeam> getGuanLiTeams(@RequestParam(value="start",required=false)String start,
                                                 @RequestParam(value="length",required=false)String length,
                                                 @RequestParam(value="draw",required=false)String draw,
                                                 @RequestParam(value = "order[0][column]",required = false)String order,
                                                 @RequestParam(value = "order[0][dir]",required = false)String orderdir,
                                                 HttpServletRequest request){


        //获取当前用户
        SysUser su=(SysUser)request.getSession().getAttribute("USERINFO");
        //获取用户ID
        int userided=su.getUid();
        int count=chanPinGuanLiService.getTeamguanliCount(userided);
        //获取排序信息
        String orderColumn = request.getParameter("columns["+order+"][data]");
        //获取管理社团信息
        List<SysTeam> Teamgls= chanPinGuanLiService.getTeamInfos(start,length,orderColumn,orderdir,userided);
        //转换成datatable格式
        DataTablePage<SysTeam> dtp = new DataTablePage<SysTeam>();
        dtp.setData(Teamgls);
        dtp.setDraw(Integer.valueOf(draw));
        dtp.setRecordsFiltered(count);
        dtp.setRecordsTotal(count);

       return dtp;

    }

//    //入库管理
//    //新增入库信息
//    @RequestMapping("addrukuxinxi")
//    @ResponseBody
//    public boolean addRuKuXinXi(RukuguanliEntity rkgl){
//        return chanPinGuanLiService.addRuKuXinXi(rkgl);
//    }
//
//    //入库管理
//    //修改入库信息
//    @RequestMapping("updaterukuxinxi")
//    @ResponseBody
//    public RukuguanliEntity updataRuKuXinXi(RukuguanliEntity rkgl){
//        return chanPinGuanLiService.updateRuKuXinXi(rkgl);
//    }
//
//    //入库管理
//    //批量修改银价
//    @RequestMapping("updateyinjiaquanbu")
//    @ResponseBody
//    public  boolean updateYinJiaQuanBu(String currentyinjia){
//        return chanPinGuanLiService.updateYinJiaQuanBu(currentyinjia);
//
//    }
//
//    //社团管理
//    //删除已加入社团信息
    @RequestMapping("deleteTeamXinXi")
    @ResponseBody
    public  boolean deleteRuKuXinXi(@RequestParam(value="tid")int tid,
                                      HttpServletRequest request){
        //获取当前用户
        SysUser su=(SysUser)request.getSession().getAttribute("USERINFO");
        //获取用户ID
        int userided=su.getUid();
        return chanPinGuanLiService.deleteTeamXinXi(tid,userided);
    }
//
//    //出库管理
//    //添加出库信息
//    @RequestMapping("savechukuxinxi")
//    @ResponseBody
//    public boolean saveChuKuXinXi(ChukuguanliEntity ckgl){
//        return chanPinGuanLiService.saveChuKuXinXi(ckgl);
//    }
//
    //社团管理
    //查看管理社团的详细信息---for  tid
    @RequestMapping("getteamxiangqing")
    @ResponseBody
    public List<SysUserOut> getTeamXiangQing(@RequestParam(value="tid")String tid){
        return  chanPinGuanLiService.getTeamxiangqing(tid);
    }

    //入社申请
    //for—ID
    @RequestMapping("addteamshenqing")
    @ResponseBody
    public boolean addTeamshenqing(@RequestParam(value="tid")int tid,
                                   HttpServletRequest request){
        //获取当前用户
        SysUser su=(SysUser)request.getSession().getAttribute("USERINFO");
        //获取用户ID
        int userided=su.getUid();

        return chanPinGuanLiService.addteamshenqing(tid,userided);
    }

    //获取入社申请
    @RequestMapping("getapplication")
    @ResponseBody
    public List<applicationOut> getappcation(HttpServletRequest request){
        //获取当前用户
        SysUser su=(SysUser)request.getSession().getAttribute("USERINFO");
        //获取用户ID
        int userided=su.getUid();

        return chanPinGuanLiService.getapplication(userided);
    }

    @RequestMapping("getallteams")
    @ResponseBody
    public List<SysTeam> getAllTeams(){
        return chanPinGuanLiService.getallteams();
    }

    //获取管理员页面的社团管理
    @RequestMapping("getadminallteams")
    @ResponseBody
    public List<SysteamOut> getadminallteams(){
        return chanPinGuanLiService.getadminallteams();
    }

    @RequestMapping("deleteteam")
    @ResponseBody
    public boolean deleteteam(@RequestParam(value="tid")int tid){
        return chanPinGuanLiService.deleteteam(tid);
    }


    //获取所有评论
    @RequestMapping("getalldiscuss")
    @ResponseBody
    public List<Discuss> alldiscuss(){
        return chanPinGuanLiService.alldiscuss();
    }
    //获取所有私信
    @RequestMapping("getallsixin")
    @ResponseBody
    public List<sixinOut> allsixin(){
        return chanPinGuanLiService.allsixin();
    }
    //删除评论
    @RequestMapping("deletediscuss")
    @ResponseBody
    public boolean deletediscuss(@RequestParam(value="id")int id){
        return chanPinGuanLiService.deletediscuss(id);
    }
    //删除私信
    @RequestMapping("deletesixin")
    @ResponseBody
    public boolean deletesixin(@RequestParam(value="id")int id){
        return chanPinGuanLiService.deletesixin(id);
    }
//
//    //出库管理
//    //获取出库库的信息列表--所有数据
//    @RequestMapping("getchukuxinxi")
//    @ResponseBody
//    public DataTablePage getChuKuXinXi(@RequestParam(value="start",required=false)String start,
//                                       @RequestParam(value="length",required=false)String length,
//                                       @RequestParam(value="draw",required=false)String draw,
//                                       @RequestParam(value = "order[0][column]",required = false)String order,
//                                       @RequestParam(value = "order[0][dir]",required = false)String orderdir,
//                                       @RequestParam(value="chukuren",required=false)String chukuren,
//                                       @RequestParam(value="dailishang",required=false)String dailishang,
//                                       @RequestParam(value = "chukushijianstart",required = false)String chukushijianstart,
//                                       @RequestParam(value = "chukushijianend",required = false)String chukushijianend,
//                                       HttpServletRequest request){
//        //获取总记录条数
//        int count=chanPinGuanLiService.getChuKuXinXiCount();
//        //获取排序信息
//        String orderColumn = request.getParameter("columns["+order+"][data]");
//
//        //获取出库信息详情
//        DataTablePage<ChukuguanliEntity> ckgls= chanPinGuanLiService.getChuKuXinXi(start,length,orderColumn,orderdir,chukuren,dailishang,chukushijianstart,chukushijianend);
//        //转换成datatable格式
//
//        ckgls.setDraw(Integer.valueOf(draw));
//        ckgls.setRecordsFiltered(count);
//        ckgls.setRecordsTotal(count);
//        return ckgls;
//
//    }
//
//    //出库管理
//    //修改出库信息
//    @RequestMapping("updatechukuxinxi")
//    @ResponseBody
//    public ChukuguanliEntity updateChukuxinxi(ChukuguanliEntity ckgl){
//        return chanPinGuanLiService.updateChukuxinxi(ckgl);
//    }
//
//    //入库管理
//    //生成excel
//    @RequestMapping("excelrukusc")
//    public  void excelRuKu(@RequestParam(value="idList",required=false)String idList,
//                           HttpServletRequest request, HttpServletResponse response){
//        final String[] RECORES_COLUMNS = new String[]{
//                "产品名称",
//                "银价",
//                "银克重",
//                "加工费/克",
//                "加工费总计",
//                "总价",
//                "生产厂家",
//                "入库人",
//                "入库时间",
//                "可否出库"
//
//
//        };
//        /*the column will display on xls files. must the same as the entity fields.对应上面的字段.*/
//        final String[] RECORES_FIELDS = new String[]{
//                "chanpinname",
//                "yinjia",
//                "yinkezhong",
//                "jiagongfei",
//                "jiagongfeizongji",
//                "zongjia",
//                "shengchachangjia",
//                "rukuren",
//                "rukushijian",
//                "kefouchuku"
//        };
//        List<RukuguanliEntity>rukuguanliEntities=null;
//        if(idList!=null&&!idList.equals("")){
//            rukuguanliEntities=chanPinGuanLiService.getRukuInfoChecked(idList);
//        }
//
//
//        HSSFWorkbook workbook = new HSSFWorkbook();
//        ExcelUtil<RukuguanliEntity> userSheet = new ExcelUtil<RukuguanliEntity>();
//
//        String excelName="入库信息表.xls";
//        try {
//            userSheet.creatAuditSheet(workbook, "入库信息",
//                    rukuguanliEntities, RECORES_COLUMNS, RECORES_FIELDS);
//            this.setResponseHeader(response, excelName);
//            OutputStream os = response.getOutputStream();
//            workbook.write(os);
//            os.flush();
//            os.close();
//
//        } catch (NoSuchMethodException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (IllegalAccessException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (IllegalArgumentException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (InvocationTargetException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (FileNotFoundException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//    }
//
//
    //社团管理
    //生成excel
    @RequestMapping("excelteamsc")
    public  void excelChuKu( HttpServletRequest request, HttpServletResponse response){
        final String[] RECORES_COLUMNS = new String[]{
                "社团ID",
                "社团名称",
                "社长ID",
                "社长姓名"
        };
        /*the column will display on xls files. must the same as the entity fields.对应上面的字段.*/
        final String[] RECORES_FIELDS = new String[]{
                "tid",
                "tname",
                "uid",
                "username"
        };
        List<SysteamOut> teamEntity=null;
         teamEntity=chanPinGuanLiService.getadminallteams();
        HSSFWorkbook workbook = new HSSFWorkbook();
        ExcelUtil<SysteamOut> userSheet = new ExcelUtil<SysteamOut>();

        String excelName="社团信息表.xls";
        try {
            userSheet.creatAuditSheet(workbook, "社团信息",
                    teamEntity, RECORES_COLUMNS, RECORES_FIELDS);
            this.setResponseHeader(response, excelName);
            OutputStream os = response.getOutputStream();
            workbook.write(os);
            os.flush();
            os.close();

        } catch (NoSuchMethodException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //发送响应流方法
    public void setResponseHeader(HttpServletResponse response, String fileName) {

        try {
            try {
                fileName = new String(fileName.getBytes(),"ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setContentType("application/force-download");// 设置强制下载不打开
            //response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }




}
