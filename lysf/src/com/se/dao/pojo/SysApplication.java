package com.se.dao.pojo;

import javax.persistence.*;

@Entity
@Table(name = "sys_application", catalog = "lysf")
public class SysApplication {
    private int id;
    private int tid;
    private int uid;

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

    @Column(name = "uid", nullable = false)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public SysApplication(int id, int tid, int uid) {
        this.id = id;
        this.tid = tid;
        this.uid = uid;
    }

    public SysApplication() {
    }
}
