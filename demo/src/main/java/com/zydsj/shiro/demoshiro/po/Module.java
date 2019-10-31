package com.zydsj.shiro.demoshiro.po;

public class Module {
    private Integer id;
    private String moduleName;
    public Module(){}

    @Override
    public String toString() {
        return "Module{" +
                "id=" + id +
                ", moduleName='" + moduleName + '\'' +
                '}';
    }

    public Module(Integer id, String moduleName) {
        this.id = id;
        this.moduleName = moduleName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }
}
