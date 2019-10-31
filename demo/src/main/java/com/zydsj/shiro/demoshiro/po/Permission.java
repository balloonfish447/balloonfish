package com.zydsj.shiro.demoshiro.po;

public class Permission {
    private Integer id;
    private String perName;
    private String perUrl;
    private Integer modual_id;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPerName() {
        return perName;
    }

    public void setPerName(String perName) {
        this.perName = perName;
    }

    public String getPerUrl() {
        return perUrl;
    }

    public void setPerUrl(String perUrl) {
        this.perUrl = perUrl;
    }

    public Integer getModual_id() {
        return modual_id;
    }

    public void setModual_id(Integer modual_id) {
        this.modual_id = modual_id;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", perName='" + perName + '\'' +
                ", perUrl='" + perUrl + '\'' +
                ", modual_id=" + modual_id +
                '}';
    }
    public Permission(){}
    public Permission(Integer id, String perName, String perUrl, Integer modual_id) {
        this.id = id;
        this.perName = perName;
        this.perUrl = perUrl;
        this.modual_id = modual_id;
    }
}
