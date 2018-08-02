package com.cyj.pojo;

import java.util.Date;

/**
 * Created by amini on 2018/7/16.
 */
public class Comment {
    private Integer commentId;
    private Integer commentPid;
    private String commentPname;
    private String commentAuthorName;
    private String commentContent;
    private Date commentCreateTime;
    private Integer commentStatus;
    private Integer commentArticleId;
    private String commentAuthorHeadImg;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getCommentPid() {
        return commentPid;
    }

    public void setCommentPid(Integer commentPid) {
        this.commentPid = commentPid;
    }

    public String getCommentPname() {
        return commentPname;
    }

    public void setCommentPname(String commentPname) {
        this.commentPname = commentPname;
    }

    public String getCommentAuthorName() {
        return commentAuthorName;
    }

    public void setCommentAuthorName(String commentAuthorName) {
        this.commentAuthorName = commentAuthorName;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentCreateTime() {
        return commentCreateTime;
    }

    public void setCommentCreateTime(Date commentCreateTime) {
        this.commentCreateTime = commentCreateTime;
    }

    public Integer getCommentStatus() {
        return commentStatus;
    }

    public void setCommentStatus(Integer commentStatus) {
        this.commentStatus = commentStatus;
    }

    public Integer getCommentArticleId() {
        return commentArticleId;
    }

    public void setCommentArticleId(Integer commentArticleId) {
        this.commentArticleId = commentArticleId;
    }

    public String getCommentAuthorHeadImg() {
        return commentAuthorHeadImg;
    }

    public void setCommentAuthorHeadImg(String commentAuthorHeadImg) {
        this.commentAuthorHeadImg = commentAuthorHeadImg;
    }
}
