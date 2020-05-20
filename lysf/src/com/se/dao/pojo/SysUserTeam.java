package com.se.dao.pojo;

import javax.persistence.*;

@Entity
@Table(name = "sys_user_team", catalog = "lysf")
public class SysUserTeam {
    private int id;
    private int uid;
    private int tid;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "uid", nullable = false)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    @Column(name = "tid", nullable = false)
    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public SysUserTeam(int id, int uid, int tid) {
        this.id = id;
        this.uid = uid;
        this.tid = tid;
    }

    public SysUserTeam() {
    }
}
