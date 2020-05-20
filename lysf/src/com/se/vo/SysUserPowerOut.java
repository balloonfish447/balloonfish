package com.se.vo;

public class SysUserPowerOut {

    private String resourcename;
    private String relink;
    private int rejigouid;
    private int reid;
    private int reopjigouid;
    private String rebianhao;

    public String getResourcename() {
        return resourcename;
    }

    public void setResourcename(String resourcename) {
        this.resourcename = resourcename;
    }

    public String getRelink() {
        return relink;
    }

    public void setRelink(String relink) {
        this.relink = relink;
    }

    public int getRejigouid() {
        return rejigouid;
    }

    public void setRejigouid(int rejigouid) {
        this.rejigouid = rejigouid;
    }

    public String getRebianhao() {
        return rebianhao;
    }

    public void setRebianhao(String rebianhao) {
        this.rebianhao = rebianhao;
    }

    public int getReid() {
        return reid;
    }

    public void setReid(int reid) {
        this.reid = reid;
    }

    public int getReopjigouid() {
        return reopjigouid;
    }

    public void setReopjigouid(int reopjigouid) {
        this.reopjigouid = reopjigouid;
    }

    public SysUserPowerOut() {
    }

    public SysUserPowerOut(String resourcename, String relink, int rejigouid,int reid,int reopjigouid,String rebianhao) {
        this.resourcename = resourcename;
        this.relink = relink;
        this.rejigouid = rejigouid;
        this.reid = reid;
        this.reopjigouid = reopjigouid;
        this.rebianhao = rebianhao;
    }
}
