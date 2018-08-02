package com.cyj.pojo;

import java.util.Date;

/**
 * Created by amini on 2018/7/25.
 */
public class Collections {
    private Integer collectionId;
    private Integer collectionUserId;
    private Integer collectionArticleId;
    private Date collectionCreateTime;

    public Integer getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(Integer collectionId) {
        this.collectionId = collectionId;
    }

    public Integer getCollectionUserId() {
        return collectionUserId;
    }

    public void setCollectionUserId(Integer collectionUserId) {
        this.collectionUserId = collectionUserId;
    }

    public Integer getCollectionArticleId() {
        return collectionArticleId;
    }

    public void setCollectionArticleId(Integer collectionArticleId) {
        this.collectionArticleId = collectionArticleId;
    }

    public Date getCollectionCreateTime() {
        return collectionCreateTime;
    }

    public void setCollectionCreateTime(Date collectionCreateTime) {
        this.collectionCreateTime = collectionCreateTime;
    }
}
