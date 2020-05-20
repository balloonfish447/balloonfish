package com.se.vo;

public class EchartsOut {
    private Number coun;
    private String tname;

    public Number getCoun() {
        return coun;
    }

    public void setCoun(Number coun) {
        this.coun = coun;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public EchartsOut() {
    }

    public EchartsOut(Number coun, String tname) {
        this.coun = coun;
        this.tname = tname;
    }
}
