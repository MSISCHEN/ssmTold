package com.cyj.service.impl;

import com.cyj.dao.CollectionsMapper;
import com.cyj.pojo.custom.CollectionsCustom;
import com.cyj.service.CollectionsService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by amini on 2018/7/25.
 */
public class CollectionsServiceImpl implements CollectionsService {
    @Autowired
    private CollectionsMapper collectionsMapper;
    @Override
    public void insertCollection(CollectionsCustom collectionsCustom) throws Exception {
        collectionsMapper.insertCollection(collectionsCustom);
    }

    @Override
    public void deleteCollectionByCommentId(Integer collectionId) throws Exception {
        collectionsMapper.deleteCollectionByCommentId(collectionId);
    }

    @Override
    public void deleteCollection(CollectionsCustom collectionsCustom) throws Exception {
        collectionsMapper.deleteCollection(collectionsCustom);
    }


    @Override
    public Integer selectCollection(CollectionsCustom collectionsCustom) throws Exception {
        return collectionsMapper.selectCollection(collectionsCustom);
    }

    @Override
    public List<Integer> getArticleIdListByUserId(int collectionUserId) throws Exception {
        return collectionsMapper.getArticleIdListByUserId(collectionUserId);
    }

    @Override
    public int getArticleCollectionNum(Integer collectionArticleId) throws Exception {
        return collectionsMapper.getArticleCollectionNum(collectionArticleId);
    }

    @Override
    public int getUserCollectionNum(Integer collectionUserId) throws Exception {
        return collectionsMapper.getUserCollectionNum(collectionUserId);
    }
}
