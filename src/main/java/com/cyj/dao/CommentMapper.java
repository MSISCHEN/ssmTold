package com.cyj.dao;

import com.cyj.pojo.Comment;

import java.util.List;

/**
 * Created by amini on 2018/7/16.
 */
public interface CommentMapper {
    int deleteByPrimaryKey(Integer commentId);

    List<Comment> selectByArticleId(Integer articleId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}
