package com.cyj.pojo.custom;

import java.util.List;

/**
 * Created by amini on 2018/7/17.
 */
public class CommentArticleVo {
    //评论信息
    private List<CommentCustom> commentCustom;
    //文章信息
    private ArticleCustom articleCustom;



    public List<CommentCustom> getCommentCustom() {
        return commentCustom;
    }

    public void setCommentCustom(List<CommentCustom> commentCustom) {
        this.commentCustom = commentCustom;
    }

    public ArticleCustom getArticleCustom() {
        return articleCustom;
    }

    public void setArticleCustom(ArticleCustom articleCustom) {
        this.articleCustom = articleCustom;
    }

  }
