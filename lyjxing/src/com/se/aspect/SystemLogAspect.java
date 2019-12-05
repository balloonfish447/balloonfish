package com.se.aspect;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.se.dao.pojo.SysUser;

@Aspect
@Component
public class SystemLogAspect {

	@Autowired(required=false)
	private HttpServletRequest request;



	/**
	 * Controller层切点 注解拦截
	 */
	/*
	 * @Pointcut("@annotation(com.xx.syslog.SystemControllerLog)") public void
	 * controllerAspect(){}
	 */

	/**
	 * 方法规则拦截
	 */
	@Pointcut("execution(* com.se.controller.*.*(..))")
	public void controllerPointerCut(){}
	/**
	 * 前置通知 用于拦截Controller层记录用户的操作的开始时间
	 * @param joinPoint 切点
	 * @throws InterruptedException
	 */
	@Before("controllerPointerCut()")
	public void doBefore(JoinPoint joinPoint) {
		//获取起止时间
		Date beginTime=new Date();
		HttpSession session=request.getSession();
		//获取用户信息
		SysUser su=(SysUser) session.getAttribute("userinfo");

		if(su!=null) {
			System.out.println("操作用户："+su.getUsername());
			System.out.println("角色信息："+su.getRoleid());
		}
		System.out.println("业务开始时间："+beginTime);


	}

	/**
	 * 后置通知 用于拦截Controller层记录用户的操作
	 * @param joinPoint 切点
	 */
	@After("controllerPointerCut()")
	public void doAfter(JoinPoint joinPoint) {


		//获取该方法的类名（业务模块）
		String logtype=joinPoint.getSignature().getDeclaringType().getSimpleName();
		//获取操作的方法名（功能模块）
		String logmess=joinPoint.getSignature().getName();
		Date endTime=new Date();
		System.out.println("业务结束时间："+endTime);
		System.out.println("业务模块："+logtype);
		System.out.println("功能模块："+logmess);

	}

	/**
	 *  异常通知
	 * @param joinPoint
	 * @param e
	 */
	@AfterThrowing(pointcut = "controllerPointerCut()", throwing = "e")
	public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) {

	}







}
