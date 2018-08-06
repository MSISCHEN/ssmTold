package com.cyj.pojo;

import java.util.Date;

public class Noices {
    private Integer noiceId;

    private Date noiceCreateTime;

    private Integer noiceStatus;

    private String noiceContent;

    public Integer getNoiceId() {
        return noiceId;
    }

    public void setNoiceId(Integer noiceId) {
        this.noiceId = noiceId;
    }

    public Date getNoiceCreateTime() {
        return noiceCreateTime;
    }

    public void setNoiceCreateTime(Date noiceCreateTime) {
        this.noiceCreateTime = noiceCreateTime;
    }

    public Integer getNoiceStatus() {
        return noiceStatus;
    }

    public void setNoiceStatus(Integer noiceStatus) {
        this.noiceStatus = noiceStatus;
    }

    public String getNoiceContent() {
        return noiceContent;
    }

    public void setNoiceContent(String noiceContent) {
        this.noiceContent = noiceContent == null ? null : noiceContent.trim();
    }
}