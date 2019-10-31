package com.zydsj.shiro.demoshiro.po;

public class User {
    private Integer id;
    private String userName;
    private String passWord;
    private String salt;
    private Integer role_id;
    public User(){}
    public User(Integer id, String userName, String passWord, String salt, Integer role_id) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.salt = salt;
        this.role_id = role_id;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", salt='" + salt + '\'' +
                ", role_id=" + role_id +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }
}
