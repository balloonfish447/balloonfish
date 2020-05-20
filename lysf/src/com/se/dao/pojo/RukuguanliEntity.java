package com.se.dao.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "rukuguanli",  catalog = "tgyj")
public class RukuguanliEntity {
    private int rkid;
    private String chanpinname;
    private String yinjia;
    private String yinkezhong;
    private String jiagongfei;
    private String jiagongfeizongji;
    private String zongjia;
    private String shengchachangjia;
    private String rukuren;
    @JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "GMT+8")
    private Date rukushijian;
    private String kefouchuku;
    private String logopath;
    private String shuliang;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rkid",unique = true, nullable = false)
    public int getRkid() {
        return rkid;
    }

    public void setRkid(int rkid) {
        this.rkid = rkid;
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


    @Column(name = "shengchachangjia", nullable = false)
    public String getShengchachangjia() {
        return shengchachangjia;
    }

    public void setShengchachangjia(String shengchachangjia) {
        this.shengchachangjia = shengchachangjia;
    }


    @Column(name = "rukuren", nullable = false)
    public String getRukuren() {
        return rukuren;
    }

    public void setRukuren(String rukuren) {
        this.rukuren = rukuren;
    }


    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "rukushijian",length = 19, nullable = false)
    public Date getRukushijian() {
        return rukushijian;
    }

    public void setRukushijian(Date rukushijian) {
        this.rukushijian = rukushijian;
    }

    @Column(name = "kefouchuku", nullable = false)
    public String getKefouchuku() {
        return kefouchuku;
    }

    public void setKefouchuku(String kefouchuku) {
        this.kefouchuku = kefouchuku;
    }

    @Column(name = "logopath", nullable = true)
    public String getLogopath() {
        return logopath;
    }

    public void setLogopath(String logopath) {
        this.logopath = logopath;
    }

    @Column(name = "shuliang")
    public String getShuliang() {
        return shuliang;
    }

    public void setShuliang(String shuliang) {
        this.shuliang = shuliang;
    }

    public RukuguanliEntity(int rkid, String chanpinname, String yinjia, String yinkezhong,
                            String jiagongfei, String jiagongfeizongji, String zongjia, String shengchachangjia,
                            String rukuren, Date rukushijian, String kefouchuku, String logopath,String shuliang) {
        this.rkid = rkid;
        this.chanpinname = chanpinname;
        this.yinjia = yinjia;
        this.yinkezhong = yinkezhong;
        this.jiagongfei = jiagongfei;
        this.jiagongfeizongji = jiagongfeizongji;
        this.zongjia = zongjia;
        this.shengchachangjia = shengchachangjia;
        this.rukuren = rukuren;
        this.rukushijian = rukushijian;
        this.kefouchuku = kefouchuku;
        this.logopath = logopath;
        this.shuliang=shuliang;
    }

    public RukuguanliEntity() {
    }
}
