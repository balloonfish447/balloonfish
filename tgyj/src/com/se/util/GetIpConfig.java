package com.se.util;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class GetIpConfig {
	
	 public static String getIpAddr(HttpServletRequest request) {   
		 String Xip = request.getHeader("X-Real-IP");
		 System.out.println(Xip);
         String ip = request.getHeader("x-forwarded-for");   
         if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
             ip = request.getHeader("Proxy-Client-IP");   
         }   
         if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
             ip = request.getHeader("WL-Proxy-Client-IP");   
         }   
         if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
             ip = request.getRemoteAddr();   
             if(ip.equals("127.0.0.1")||ip.equals("0:0:0:0:0:0:0:1")){     

                 InetAddress inet=null;     
                 try {     
                     inet = InetAddress.getLocalHost();     
                 } catch (Exception e) {     
                     e.printStackTrace();     
                 }     
                 ip= inet.getHostAddress();     
             }  
         }   

         if(ip != null && ip.length() > 15){    
             if(ip.indexOf(",")>0){     
                 ip = ip.substring(0,ip.indexOf(","));     
             }     
         }     
         return ip;   
  }  


}
