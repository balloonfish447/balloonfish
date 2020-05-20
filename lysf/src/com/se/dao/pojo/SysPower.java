package com.se.dao.pojo;


import javax.persistence.*;


@Entity
@Table(name = "sys_power", catalog = "lysf")
public class SysPower implements java.io.Serializable {

	private int pid;
	private int rid;
	private int reid;

	public SysPower() {
	}

	public SysPower(int pid, int rid, int reid) {
		this.pid = pid;
		this.rid = rid;
		this.reid = reid;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pid", unique = true, nullable = false)
	public int getPid() {
		return this.pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	@Column(name = "rid", nullable = false)
	public int getRid() {
		return this.rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	@Column(name = "reid", nullable = false)
	public int getReid() {
		return this.reid;
	}

	public void setReid(int reid) {
		this.reid = reid;
	}

}
