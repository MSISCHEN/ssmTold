package com.cyj.pojo.custom;

import com.cyj.utils.others.Page;

/**
 * 用于封装文章列表，包括文章信息，作者信息
 * Created by amini on 2018/7/15.
 */
public class ArticleListVo {
    //文章信息
    private ArticleCustom articleCustom;
    //作者信息
    private UserCustom userCustom;

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
