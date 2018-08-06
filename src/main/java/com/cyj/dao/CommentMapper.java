package com.cyj.dao;

import com.cyj.pojo.Comment;
import com.cyj.pojo.custom.CommentCustom;

import java.util.List;

/**
 * Created by amini on 2018/7/16.
 */
public interface CommentMapper {
    int deleteByPrimaryKey(Integer commentId);

    List<CommentCustom> selectByArticleId(Integer articleId);

    int insert(Comment record);

    public Integer getCommentNum()throws Exception;

    int insertSelective(Comment record);

    //根据文章id获取评论数
    public Integer getCommentNumByArticleId(Integer commentArticleId) throws Exception;

    Comment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}
