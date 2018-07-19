package com.cyj.pojo.custom;

/**
 * Created by amini on 2018/7/17.
 */
public class CommentArticleVo {
    //评论信息
    private CommentCustom commentCustom;
    //文章信息
    private ArticleCustom articleCustom;

    //用户的信息
    private UserCustom userCustom;

    public CommentCustom getCommentCustom() {
        return commentCustom;
    }

    public void setCommentCustom(CommentCustom commentCustom) {
        this.commentCustom = commentCustom;
    }

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
}
