package com.cyj.pojo.custom;

import com.cyj.pojo.Article;
import com.cyj.pojo.User;

/**
 * Created by amini on 2018/7/16.
 */
public class UserArticleCustom{
    private User user;

    private Article article;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}
