package com.cyj.pojo.custom;

import com.cyj.pojo.Comment;

/**
 * Created by amini on 2018/7/17.
 */
public class CommentCustom extends Comment{
    //评论者的头像
    private String commentAuthorHeadImg;

    @Override
    public String getCommentAuthorHeadImg() {
        return commentAuthorHeadImg;
    }

    @Override
    public void setCommentAuthorHeadImg(String commentAuthorHeadImg) {
        this.commentAuthorHeadImg = commentAuthorHeadImg;
    }
}
