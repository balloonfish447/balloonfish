package com.se.dao.pojo;

import javax.persistence.*;

@Entity
@Table(name = "teaminfomation", catalog = "lysf")
public class SysTeamInformation {
    private int id;
    private int tid;
    private String founttime;
    private int fountuserid;
    private int count;
    private String dress;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "tid", nullable = false)
    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    @Column(name = "founttime", nullable = false)
    public String getFounttime() {
        return founttime;
    }

    public void setFounttime(String founttime) {
        this.founttime = founttime;
    }

    @Column(name = "fountuserid", nullable = false)
    public int getFountuserid() {
        return fountuserid;
    }

    public void setFountuserid(int fountuserid) {
        this.fountuserid = fountuserid;
    }

    @Column(name = "count", nullable = false)
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Column(name = "dress", nullable = false)
    public String getDress() {
        return dress;
    }

    public void setDress(String dress) {
        this.dress = dress;
    }

    public SysTeamInformation() {
    }

    public SysTeamInformation(int id, int tid, String founttime, int fountuserid, int count, String dress) {
        this.id = id;
        this.tid = tid;
        this.founttime = founttime;
        this.fountuserid = fountuserid;
        this.count = count;
        this.dress = dress;
    }
}
