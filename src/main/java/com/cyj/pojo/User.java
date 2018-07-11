package com.cyj.pojo;

import com.mysql.fabric.xmlrpc.base.Data;

/**
 * Created by amini on 2018/7/12.
 */
public class User {
    private Integer id;
    private String name;
    private String password;
    private String email;
    private String phone;
    private Data birthday;
    private char sex;
    private String simpleTalk;
    private String headImg;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Data getBirthday() {
        return birthday;
    }

    public void setBirthday(Data birthday) {
        this.birthday = birthday;
    }

    public char getSex() {
        return sex;
    }

    public void setSex(char sex) {
        this.sex = sex;
    }

    public String getSimpleTalk() {
        return simpleTalk;
    }

    public void setSimpleTalk(String simpleTalk) {
        this.simpleTalk = simpleTalk;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }
}
