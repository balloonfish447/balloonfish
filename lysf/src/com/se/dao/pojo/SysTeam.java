package com.se.dao.pojo;

import javax.persistence.*;

@Entity
@Table(name = "sys_team", catalog = "lysf")
public class SysTeam implements java.io.Serializable {

    private int tid;
    private String tname;
    private int uid;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tid", unique = true, nullable = false)
    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    @Column(name = "tname", nullable = false)
    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    @Column(name = "uid", nullable = false)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public SysTeam(int tid, String tname, int uid) {
        this.tid = tid;
        this.tname = tname;
        this.uid = uid;
    }

    public SysTeam() {
    }
}
