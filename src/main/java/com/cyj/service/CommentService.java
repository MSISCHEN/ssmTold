package com.cyj.service;

import com.cyj.pojo.Comment;
import com.cyj.pojo.custom.CommentArticleVo;
import java.util.List;

/**
 * Created by amini on 2018/7/17.
 */
public interface CommentService {
    //添加评论
    public Integer insertComment(Comment comment) throws Exception;

    //根据文章id获取评论列表
    public List<CommentArticleVo> listCommentByArticleId(Integer status, Integer articleId) throws Exception;

    //根据id获取评论
    public CommentArticleVo getCommentById(Integer id) throws Exception;


    //获取所有评论列表
    public List<CommentArticleVo> listCommentByPage(Integer status, Integer pageNow, Integer pageSize) throws Exception;

    //获得评论列表
    public List<CommentArticleVo> listCommentVo(Integer status) throws Exception;

    /*//获得评论列表
    public List<CommentArticleVo> listComment(Integer status) throws Exception;*/

    //删除评论
    public void deleteComment(Integer id) throws Exception;

    //修改评论
    public void updateComment(Comment comment) throws Exception;

    //统计评论数
    public Integer countComment(Integer status) throws Exception;

    //获得最近评论
    public List<CommentArticleVo> listRecentComment(Integer limit) throws Exception;

    //获得评论的子评论
    public List<Comment> listChildComment(Integer id) throws Exception;

}
