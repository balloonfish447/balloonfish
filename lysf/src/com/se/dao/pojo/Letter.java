package com.se.dao.pojo;

import javax.persistence.*;

@Entity
@Table(name = "letter", catalog = "lysf")
public class Letter {
    private int id;
    private String text;
    private int uid;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    @Column(name = "text", nullable = false)
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Column(name = "uid", nullable = false)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Letter() {
    }

    public Letter(int id, String text, int uid) {
        this.id = id;
        this.text = text;
        this.uid = uid;
    }
}
