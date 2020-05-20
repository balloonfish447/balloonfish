package com.se.vo;

public class applicationOut {
    private int id;
    private String username;
    private int uid;
    private String tname;
    private int tid;


    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public applicationOut(int id, String username, int uid, String tname,int tid) {
        this.id = id;
        this.username = username;
        this.uid = uid;
        this.tname = tname;
        this.tid=tid;
    }

    public applicationOut() {
    }
}
