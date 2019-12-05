package com.se.dao.pojo;

// default package
// Generated 2019-1-9 14:21:15 by Hibernate Tools 4.3.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysPower generated by hbm2java
 */
@Entity
@Table(name = "sys_power", catalog = "systementry")
public class SysPower implements java.io.Serializable {

	private int pid;
	private String pname;
	private String pbianma;

	public SysPower() {
	}

	public SysPower(int pid, String pname, String pbianma) {
		this.pid = pid;
		this.pname = pname;
		this.pbianma = pbianma;
	}

	@Id

	@Column(name = "pid", unique = true, nullable = false)
	public int getPid() {
		return this.pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	@Column(name = "pname", nullable = false)
	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	@Column(name = "pbianma", nullable = false)
	public String getPbianma() {
		return this.pbianma;
	}

	public void setPbianma(String pbianma) {
		this.pbianma = pbianma;
	}

}
