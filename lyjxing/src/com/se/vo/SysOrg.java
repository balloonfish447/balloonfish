package com.se.vo;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;


public class SysOrg {
	
	private int id;
	@JsonProperty("pId") 
	private int pId;
	private String name;
	@JsonProperty("isParent")
	private boolean isParent ;
	private boolean open;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@JsonIgnore
	public boolean isParent() {
		return isParent;
	}
	public void setParent(boolean isParent) {
		this.isParent = isParent;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public SysOrg(int id, int pId, String name, boolean isParent, boolean open) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.isParent = isParent;
		this.open = open;
	}
	public SysOrg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SysOrg(int id, int pId, String name) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
	}
	
	
	
	
	
	

}
