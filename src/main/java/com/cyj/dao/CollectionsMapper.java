package com.cyj.dao;

import com.cyj.pojo.custom.CollectionsCustom;

import java.util.List;

/**
 * Created by amini on 2018/7/25.
 */
public interface CollectionsMapper {

    //增加关系
    public void insertCollection(CollectionsCustom collectionsCustom) throws Exception;

    //删除关系
    public void deleteCollectionByCommentId(Integer collectionId) throws Exception;

    //删除关系
    public void deleteCollection(CollectionsCustom collectionsCustom) throws Exception;

    //根据文章的id获取收藏的数量
    public Integer selectCollectionNumByArticleId(Integer collectionArticleId) throws Exception;

    //查找关系
    public Integer selectCollection(CollectionsCustom collectionsCustom) throws Exception;

    //根据用户的id得到收藏的列表
    public List<Integer> getArticleIdListByUserId(int collectionUserId) throws Exception;

    //读取一个文章有多少收藏量
    public int getArticleCollectionNum(Integer collectionArticleId) throws Exception;

    //读取一个用户关注了多少文章
    public int getUserCollectionNum(Integer collectionUserId) throws Exception;
}
