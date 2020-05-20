package com.se.dao.pojo;

// Generated 2017-9-5 16:58:22 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * HpeWenzhang generated by hbm2java
 */
@Entity
@Table(name = "hpe_wenzhang", catalog = "tgyj")
public class HpeWenzhang implements java.io.Serializable {

	private Integer tieId;
	private String wenzhangName;
	private String wenzhangLink;
	private String wenzhangUser;
	private String wenzhangTuijian;
	private String wenzhangFangwen;
	private String wenzhangTitle;
	private Date createTime;
	private String wenzhangLeibie;
	private String wenzhangHangye;
	private String wenzhangZhaiyao;
	private String wenzhangTupianlink;
	private String wenzhangUserTouxiang;


	public HpeWenzhang() {
	}

	

	public HpeWenzhang(Integer tieId, String wenzhangName, String wenzhangLink,
			String wenzhangUser, String wenzhangTuijian,
			String wenzhangFangwen, String wenzhangTitle, Date createTime,
			String wenzhangLeibie, String wenzhangHangye,
			String wenzhangZhaiyao, String wenzhangTupianlink)
			 {
		super();
		this.tieId = tieId;
		this.wenzhangName = wenzhangName;
		this.wenzhangLink = wenzhangLink;
		this.wenzhangUser = wenzhangUser;
		this.wenzhangTuijian = wenzhangTuijian;
		this.wenzhangFangwen = wenzhangFangwen;
		this.wenzhangTitle = wenzhangTitle;
		this.createTime = createTime;
		this.wenzhangLeibie = wenzhangLeibie;
		this.wenzhangHangye = wenzhangHangye;
		this.wenzhangZhaiyao = wenzhangZhaiyao;
		this.wenzhangTupianlink = wenzhangTupianlink;
		this.wenzhangUserTouxiang = wenzhangUserTouxiang;

	}



	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "tie_id", unique = true, nullable = false)
	public Integer getTieId() {
		return this.tieId;
	}

	public void setTieId(Integer tieId) {
		this.tieId = tieId;
	}

	@Column(name = "wenzhang_name")
	public String getWenzhangName() {
		return this.wenzhangName;
	}

	public void setWenzhangName(String wenzhangName) {
		this.wenzhangName = wenzhangName;
	}

	@Column(name = "wenzhang_link")
	public String getWenzhangLink() {
		return this.wenzhangLink;
	}

	public void setWenzhangLink(String wenzhangLink) {
		this.wenzhangLink = wenzhangLink;
	}

	@Column(name = "wenzhang_user")
	public String getWenzhangUser() {
		return this.wenzhangUser;
	}

	public void setWenzhangUser(String wenzhangUser) {
		this.wenzhangUser = wenzhangUser;
	}

	@Column(name = "wenzhang_tuijian")
	public String getWenzhangTuijian() {
		return this.wenzhangTuijian;
	}

	public void setWenzhangTuijian(String wenzhangTuijian) {
		this.wenzhangTuijian = wenzhangTuijian;
	}

	@Column(name = "wenzhang_fangwen")
	public String getWenzhangFangwen() {
		return this.wenzhangFangwen;
	}

	public void setWenzhangFangwen(String wenzhangFangwen) {
		this.wenzhangFangwen = wenzhangFangwen;
	}

	@Column(name = "wenzhang_title")
	public String getWenzhangTitle() {
		return this.wenzhangTitle;
	}

	public void setWenzhangTitle(String wenzhangTitle) {
		this.wenzhangTitle = wenzhangTitle;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "wenzhang_leibie")
	public String getWenzhangLeibie() {
		return this.wenzhangLeibie;
	}

	public void setWenzhangLeibie(String wenzhangLeibie) {
		this.wenzhangLeibie = wenzhangLeibie;
	}

	@Column(name = "wenzhang_hangye")
	public String getWenzhangHangye() {
		return this.wenzhangHangye;
	}

	public void setWenzhangHangye(String wenzhangHangye) {
		this.wenzhangHangye = wenzhangHangye;
	}

	@Column(name = "wenzhang_zhaiyao", length = 4000)
	public String getWenzhangZhaiyao() {
		return this.wenzhangZhaiyao;
	}

	public void setWenzhangZhaiyao(String wenzhangZhaiyao) {
		this.wenzhangZhaiyao = wenzhangZhaiyao;
	}

	@Column(name = "wenzhang_tupianlink")
	public String getWenzhangTupianlink() {
		return this.wenzhangTupianlink;
	}

	public void setWenzhangTupianlink(String wenzhangTupianlink) {
		this.wenzhangTupianlink = wenzhangTupianlink;
	}
	
	
	@Column(name = "wenzhang_user_touxiang")
	public String getWenzhangUserTouxiang() {
		return wenzhangUserTouxiang;
	}

	public void setWenzhangUserTouxiang(String wenzhangUserTouxiang) {
		this.wenzhangUserTouxiang = wenzhangUserTouxiang;
	}


}
