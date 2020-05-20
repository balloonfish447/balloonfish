package com.se.vo;

public class sixinOut {
    private int id;
    private String text;
    private int uid;
    private String username;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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

    public sixinOut(int id, String text, int uid, String username) {
        this.id = id;
        this.text = text;
        this.uid = uid;
        this.username = username;
    }

    public sixinOut() {
    }
}
