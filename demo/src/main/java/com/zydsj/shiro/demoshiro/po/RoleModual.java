package com.zydsj.shiro.demoshiro.po;

public class RoleModual {
    private Integer id;
    private Integer role_id;
    private Integer modual_id;

    @Override
    public String toString() {
        return "RoleModual{" +
                "id=" + id +
                ", role_id=" + role_id +
                ", modual_id=" + modual_id +
                '}';
    }
    public RoleModual(){}
    public RoleModual(Integer id, Integer role_id, Integer modual_id) {
        this.id = id;
        this.role_id = role_id;
        this.modual_id = modual_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    public Integer getModual_id() {
        return modual_id;
    }

    public void setModual_id(Integer modual_id) {
        this.modual_id = modual_id;
    }
}
