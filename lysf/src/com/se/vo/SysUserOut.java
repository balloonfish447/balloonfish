package com.se.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SysUserOut {
	
		private int uid;
	    private String sno;
		private String username;
		private String password;
		private String email;
		private String phone;
		/*private String registerAddress;*/
		
		/*private Date registerTime;
		@JsonFormat(pattern = "yyyy/MM/dd hh:mm:ss")
		private Date loginTime;	
		@JsonFormat(pattern = "yyyy/MM/dd hh:mm:ss")
		private Date lastLoginTime;
		private String loginCount;
		private String signed;*/
		/*private Integer roleid;
		private Integer organizeid;
		private Integer opid;*/
		private String rname;
		public int getUid() {
			return uid;
		}
		public void setUid(int uid) {
			this.uid = uid;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
	    public String getSno() {
		return sno;
	}
	    public void setSno(String sno) {
		this.sno = sno;
	}
		/*public String getRegisterAddress() {
			return registerAddress;
		}
		public void setRegisterAddress(String registerAddress) {
			this.registerAddress = registerAddress;
		}*/
		/*public Date getRegisterTime() {
			return registerTime;
		}
		public void setRegisterTime(Date registerTime) {
			this.registerTime = registerTime;
		}
		public Date getLoginTime() {
			return loginTime;
		}
		public void setLoginTime(Date loginTime) {
			this.loginTime = loginTime;
		}
		public Date getLastLoginTime() {
			return lastLoginTime;
		}
		public void setLastLoginTime(Date lastLoginTime) {
			this.lastLoginTime = lastLoginTime;
		}
		public String getLoginCount() {
			return loginCount;
		}
		public void setLoginCount(String loginCount) {
			this.loginCount = loginCount;
		}
		public String getSigned() {
			return signed;
		}
		public void setSigned(String signed) {
			this.signed = signed;
		}
		public Integer getRoleid() {
			return roleid;
		}
		public void setRoleid(Integer roleid) {
			this.roleid = roleid;
		}
		public Integer getOrganizeid() {
			return organizeid;
		}
		public void setOrganizeid(Integer organizeid) {
			this.organizeid = organizeid;
		}
		public Integer getOpid() {
			return opid;
		}
		public void setOpid(Integer opid) {
			this.opid = opid;
		}*/
		public String getRname() {
			return rname;
		}
		public void setRname(String rname) {
			this.rname = rname;
		}
		/*public SysUserOut(int uid, String username, String password, String email, String phone, String registerAddress,
				Date registerTime, Date loginTime, Date lastLoginTime, String loginCount, String signed, Integer roleid,
				Integer organizeid, Integer opid, String rname) {
			super();
			this.uid = uid;
			this.username = username;
			this.password = password;
			this.email = email;
			this.phone = phone;
			this.registerAddress = registerAddress;
			this.registerTime = registerTime;
			this.loginTime = loginTime;
			this.lastLoginTime = lastLoginTime;
			this.loginCount = loginCount;
			this.signed = signed;
			this.roleid = roleid;
			this.organizeid = organizeid;
			this.opid = opid;
			this.rname = rname;
		}*/
		public SysUserOut() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		
		

}



