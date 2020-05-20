package com.se.dao.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sys_resource", catalog = "lysf")
public class SysResource {
	
	private int reid;
	private String rename;
	private String relink;
	private String rebianhao;
	private int rejigouid;
	private int reopjigouid;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reid", unique = true, nullable = false)
	public int getReid() {
		return reid;
	}
	public void setReid(int reid) {
		this.reid = reid;
	}
	
	@Column(name = "resourcename", nullable = false)
	public String getRename() {
		return rename;
	}
	public void setRename(String rename) {
		this.rename = rename;
	}
	
	@Column(name = "relink", nullable = false)
	public String getRelink() {
		return relink;
	}
	public void setRelink(String relink) {
		this.relink = relink;
	}
	
	@Column(name = "rebianhao")
	public String getRebianhao() {
		return rebianhao;
	}
	public void setRebianhao(String rebianhao) {
		this.rebianhao = rebianhao;
	}
	@Column(name = "rejigouid")
	public int getRejigouid() {
		return rejigouid;
	}

	public void setRejigouid(int rejigouid) {
		this.rejigouid = rejigouid;
	}
	@Column(name = "reopjigouid")
	public int getReopjigouid() {
		return reopjigouid;
	}

	public void setReopjigouid(int reopjigouid) {
		this.reopjigouid = reopjigouid;
	}

	public SysResource(int reid, String rename, String relink, String rebianhao, int rejigouid, int reopjigouid) {
		this.reid = reid;
		this.rename = rename;
		this.relink = relink;
		this.rebianhao = rebianhao;
		this.rejigouid = rejigouid;
		this.reopjigouid = reopjigouid;
	}

	public SysResource() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
