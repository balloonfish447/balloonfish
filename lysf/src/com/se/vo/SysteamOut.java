package com.se.vo;

public class SysteamOut {
    private int tid;
    private String tname;
    private int uid;
    private String username;

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public SysteamOut(int tid, String tname, int uid, String username) {
        this.tid = tid;
        this.tname = tname;
        this.uid = uid;
        this.username = username;
    }

    public SysteamOut() {
    }
}
