package com.se.dao.pojo;

import javax.persistence.*;

@Entity
@Table(name = "notice", catalog = "lysf")
public class Notice {
    private int id;
    private String text;
    private String time;

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

    @Column(name = "time", nullable = false)
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Notice() {
    }

    public Notice(int id, String text, String time) {
        this.id = id;
        this.text = text;
        this.time = time;
    }
}
