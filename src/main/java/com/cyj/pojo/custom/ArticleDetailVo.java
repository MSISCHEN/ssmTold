package com.cyj.pojo.custom;

import java.util.List;

/**
 * Created by amini on 2018/7/20.
 */
public class ArticleDetailVo {
    //文章信息
    private ArticleCustom articleCustom;
    //作者信息
    private UserCustom userCustom;
    //评论信息
    private List<CommentCustom> commentCustomList;

    public ArticleCustom getArticleCustom() {
        return articleCustom;
    }

    public void setArticleCustom(ArticleCustom articleCustom) {
        this.articleCustom = articleCustom;
    }

    public UserCustom getUserCustom() {
        return userCustom;
    }

    public void setUserCustom(UserCustom userCustom) {
        this.userCustom = userCustom;
    }

    public List<CommentCustom> getCommentCustomList() {
        return commentCustomList;
    }

    public void setCommentCustomList(List<CommentCustom> commentCustomList) {
        this.commentCustomList = commentCustomList;
    }
}
