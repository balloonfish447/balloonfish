package com.se.dao.pojo;

import javax.persistence.*;

@Entity
@Table(name = "sys_user_information", catalog = "lysf")
public class SysUserInformation {

    private int id;
    private int uid;
    private String sex;
    private int age;
    private String college;
    private String grade;
    private String uclass;
    private String createtime;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "uid", nullable = false)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    @Column(name = "sex", nullable = false)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Column(name = "age", nullable = false)
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Column(name = "college", nullable = false)
    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    @Column(name = "grade", nullable = false)
    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Column(name = "uclass", nullable = false)
    public String getUclass() {
        return uclass;
    }

    public void setUclass(String uclass) {
        this.uclass = uclass;
    }

    @Column(name = "createtime", nullable = false)
    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public SysUserInformation() {
    }

    public SysUserInformation(int id, int uid, String sex, int age, String college, String grade, String uclass, String createtime) {
        this.id = id;
        this.uid = uid;
        this.sex = sex;
        this.age = age;
        this.college = college;
        this.grade = grade;
        this.uclass = uclass;
        this.createtime = createtime;
    }
}
