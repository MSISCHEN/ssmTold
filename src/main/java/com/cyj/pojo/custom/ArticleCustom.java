package com.cyj.pojo.custom;

import com.cyj.pojo.Article;

/**
 * Created by amini on 2018/7/15.
 */
public class ArticleCustom extends Article {
    private Integer collectionNum;

    private Integer commentNum;


    public Integer getCollectionNum() {
        return collectionNum;
    }

    public void setCollectionNum(Integer collectionNum) {
        this.collectionNum = collectionNum;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }
}
