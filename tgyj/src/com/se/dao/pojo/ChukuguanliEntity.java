package com.se.dao.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "chukuguanli",  catalog = "tgyj")
public class ChukuguanliEntity {
    private int ckid;
    private String chanpinname;
    private String yinjia;
    private String yinkezhong;
    private String jiagongfei;
    private String jiagongfeizongji;
    private String zongjia;
    private String dailishang;
    private String chukuren;
    @JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "GMT+8")
    private Date chukushijian;
    private int rkid;
    private String logopath;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ckid",unique = true, nullable = false)
    public int getCkid() {
        return ckid;
    }

    public void setCkid(int ckid) {
        this.ckid = ckid;
    }

    @Column(name = "chanpinname", nullable = false)
    public String getChanpinname() {
        return chanpinname;
    }

    public void setChanpinname(String chanpinname) {
        this.chanpinname = chanpinname;
    }

    @Column(name = "yinjia", nullable = false)
    public String getYinjia() {
        return yinjia;
    }

    public void setYinjia(String yinjia) {
        this.yinjia = yinjia;
    }

    @Column(name = "yinkezhong", nullable = false)
    public String getYinkezhong() {
        return yinkezhong;
    }

    public void setYinkezhong(String yinkezhong) {
        this.yinkezhong = yinkezhong;
    }

    @Column(name = "jiagongfei", nullable = false)
    public String getJiagongfei() {
        return jiagongfei;
    }

    public void setJiagongfei(String jiagongfei) {
        this.jiagongfei = jiagongfei;
    }

    @Column(name = "jiagongfeizongji", nullable = false)
    public String getJiagongfeizongji() {
        return jiagongfeizongji;
    }

    public void setJiagongfeizongji(String jiagongfeizongji) {
        this.jiagongfeizongji = jiagongfeizongji;
    }

    @Column(name = "zongjia", nullable = false)
    public String getZongjia() {
        return zongjia;
    }

    public void setZongjia(String zongjia) {
        this.zongjia = zongjia;
    }

    @Column(name = "dailishang", nullable = false)
    public String getDailishang() {
        return dailishang;
    }

    public void setDailishang(String dailishang) {
        this.dailishang = dailishang;
    }

    @Column(name = "chukuren", nullable = false)
    public String getChukuren() {
        return chukuren;
    }

    public void setChukuren(String chukuren) {
        this.chukuren = chukuren;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "chukushijian", nullable = false)
    public Date getChukushijian() {
        return chukushijian;
    }

    public void setChukushijian(Date chukushijian) {
        this.chukushijian = chukushijian;
    }

    @Column(name = "rkid", nullable = false)
    public int getRkid() {
        return rkid;
    }

    public void setRkid(int rkid) {
        this.rkid = rkid;
    }

    @Column(name = "logopath", nullable = true)
    public String getLogopath() {
        return logopath;
    }

    public void setLogopath(String logopath) {
        this.logopath = logopath;
    }

    public ChukuguanliEntity(int ckid, String chanpinname, String yinjia, String yinkezhong, String jiagongfei,
                             String jiagongfeizongji, String zongjia, String dailishang, String chukuren,
                             Date chukushijian, int rkid,String logopath) {
        this.ckid = ckid;
        this.chanpinname = chanpinname;
        this.yinjia = yinjia;
        this.yinkezhong = yinkezhong;
        this.jiagongfei = jiagongfei;
        this.jiagongfeizongji = jiagongfeizongji;
        this.zongjia = zongjia;
        this.dailishang = dailishang;
        this.chukuren = chukuren;
        this.chukushijian = chukushijian;
        this.rkid = rkid;
        this.logopath = logopath;
    }

    public ChukuguanliEntity() {
    }
}
