package com.se.vo;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;


public class SysOrg {
	
	private int id;
	@JsonProperty("pId") 
	private int pId;
	private String name;
	private boolean checked;
	//根据该值是否存在判断checked属性
	private Object reid;
	/*@JsonProperty("isParent")*/
	/*private boolean isParent ;
	private boolean open;*/
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

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public Object getReid() {
		return reid;
	}

	public void setReid(Object reid) {
		this.reid = reid;
	}
	/*@JsonIgnore
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
	}*/

	public SysOrg() {
		super();
	}
	public SysOrg(int id, int pId, String name,boolean checked,Object reid) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.checked=checked;
		this.reid=reid;
	}
	
	
	
	
	
	

}
