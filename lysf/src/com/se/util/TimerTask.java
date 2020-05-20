package com.se.util;

import com.se.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TimerTask {

    @Autowired
    private SysUserService sysUserService;

    @Scheduled(cron="30 10 1 20 * ?")  	 // 每月20号1点10分30秒触发
    public void test(){
        try {
            System.out.println("定时任务启动！");
            //执行任务
            boolean b=sysUserService.deletenotice();
            if(b){
                System.out.println("定时删除多余公告信息完成！");
            }
        } catch (Exception e) {
            System.out.println("定时删除多余公告信息失败！");
        }
    }
}
