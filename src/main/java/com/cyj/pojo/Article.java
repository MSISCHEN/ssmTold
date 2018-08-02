package com.cyj.pojo;

import java.util.Date;

/**
 * Created by amini on 2018/7/12.
 */
public class Article {
    private Integer articleId;
    private Integer articleUserId;
    private String articleTitle;
    private String articleDescription;
    private String articleContent;
    private Date articlePostTime;
    private Date articleUpdateTime;
    private Integer articleLikeNum;
    private String articleCast;
    private Integer articleStatus;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getArticleUserId() {
        return articleUserId;
    }

    public void setArticleUserId(Integer articleUserId) {
        this.articleUserId = articleUserId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleDescription() {
        return articleDescription;
    }

    public void setArticleDescription(String articleDescription) {
        this.articleDescription = articleDescription;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public Date getArticlePostTime() {
        return articlePostTime;
    }

    public void setArticlePostTime(Date articlePostTime) {
        this.articlePostTime = articlePostTime;
    }

    public Date getArticleUpdateTime() {
        return articleUpdateTime;
    }

    public void setArticleUpdateTime(Date articleUpdateTime) {
        this.articleUpdateTime = articleUpdateTime;
    }

    public Integer getArticleLikeNum() {
        return articleLikeNum;
    }

    public void setArticleLikeNum(Integer articleLikeNum) {
        this.articleLikeNum = articleLikeNum;
    }

    public String getArticleCast() {
        return articleCast;
    }

    public void setArticleCast(String articleCast) {
        this.articleCast = articleCast;
    }

    public Integer getArticleStatus() {
        return articleStatus;
    }

    public void setArticleStatus(Integer articleStatus) {
        this.articleStatus = articleStatus;
    }
}
