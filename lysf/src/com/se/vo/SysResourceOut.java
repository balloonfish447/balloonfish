package com.se.vo;

public class SysResourceOut {
    private int reid;
    private String resourcename;
    private String relink;
    private String rebianhao;
    private int rejigouid;
    private int reopjigouid;
    private String fucaidan;
    private String zicaidan;

    public String getZicaidan() {
        return zicaidan;
    }

    public void setZicaidan(String zicaidan) {
        this.zicaidan = zicaidan;
    }

    public int getReid() {
        return reid;
    }

    public void setReid(int reid) {
        this.reid = reid;
    }

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

    public String getRebianhao() {
        return rebianhao;
    }

    public void setRebianhao(String rebianhao) {
        this.rebianhao = rebianhao;
    }

    public int getRejigouid() {
        return rejigouid;
    }

    public void setRejigouid(int rejigouid) {
        this.rejigouid = rejigouid;
    }

    public int getReopjigouid() {
        return reopjigouid;
    }

    public void setReopjigouid(int reopjigouid) {
        this.reopjigouid = reopjigouid;
    }

    public String getFucaidan() {
        return fucaidan;
    }

    public void setFucaidan(String fucaidan) {
        this.fucaidan = fucaidan;
    }

    public SysResourceOut() {
    }

    public SysResourceOut(int reid, String resourcename, String relink, String rebianhao, int rejigouid, int reopjigouid, String fucaidan, String zicaidan) {
        this.reid = reid;
        this.resourcename = resourcename;
        this.relink = relink;
        this.rebianhao = rebianhao;
        this.rejigouid = rejigouid;
        this.reopjigouid = reopjigouid;
        this.fucaidan = fucaidan;
        this.zicaidan = zicaidan;
    }
}
