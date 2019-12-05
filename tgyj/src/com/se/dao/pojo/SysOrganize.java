package com.se.dao.pojo;

// default package
// Generated 2019-1-9 14:21:15 by Hibernate Tools 4.3.5.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysOrganize generated by hbm2java
 */
@Entity
@Table(name = "sys_organize", catalog = "systementry")
public class SysOrganize implements java.io.Serializable {

	private int oid;
	private String oname;
	private int ojigouid;
	private String otype;
	private String ozhuangtai;
	private int oparentid;
	private boolean isparent;

	public SysOrganize() {
	}

	

	public SysOrganize(int oid, String oname, int ojigouid, String otype, String ozhuangtai, int oparentid,
			boolean isparent) {
		super();
		this.oid = oid;
		this.oname = oname;
		this.ojigouid = ojigouid;
		this.otype = otype;
		this.ozhuangtai = ozhuangtai;
		this.oparentid = oparentid;
		this.isparent = isparent;
	}



	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "oid", unique = true, nullable = false)
	public int getOid() {
		return this.oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	@Column(name = "oname", nullable = false)
	public String getOname() {
		return this.oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	@Column(name = "ojigouid", nullable = false)
	public int getOjigouid() {
		return this.ojigouid;
	}

	public void setOjigouid(int ojigouid) {
		this.ojigouid = ojigouid;
	}

	@Column(name = "otype", nullable = false)
	public String getOtype() {
		return this.otype;
	}

	public void setOtype(String otype) {
		this.otype = otype;
	}

	@Column(name = "ozhuangtai", nullable = false)
	public String getOzhuangtai() {
		return this.ozhuangtai;
	}

	public void setOzhuangtai(String ozhuangtai) {
		this.ozhuangtai = ozhuangtai;
	}

	@Column(name = "oparentid", nullable = false)
	public int getOparentid() {
		return this.oparentid;
	}

	public void setOparentid(int oparentid) {
		this.oparentid = oparentid;
	}

	@Column(name = "isparent", nullable = false)
	public boolean isIsparent() {
		return isparent;
	}

	public void setIsparent(boolean isparent) {
		this.isparent = isparent;
	}

	
	
	

}
