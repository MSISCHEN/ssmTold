package com.cyj.service.impl;

import com.cyj.dao.ArticleMapper;
import com.cyj.dao.CommentMapper;
import com.cyj.dao.UserMapper;
import com.cyj.pojo.Comment;
import com.cyj.pojo.custom.CommentArticleVo;
import com.cyj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by amini on 2018/7/17.
 */
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public Integer insertComment(Comment comment) throws Exception {
        return commentMapper.insert(comment);
    }

    @Override
    public List<CommentArticleVo> listCommentByArticleId(Integer status, Integer articleId) throws Exception {
        List<CommentArticleVo> commentArticleVos=null;
        if (articleId!=0){
            List<Comment> comment=commentMapper.selectByArticleId(articleId);
//            commentArticleVos
        }

        return null;
    }

    @Override
    public CommentArticleVo getCommentById(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<CommentArticleVo> listCommentByPage(Integer status, Integer pageNow, Integer pageSize) throws Exception {
        return null;
    }

    @Override
    public List<CommentArticleVo> listCommentVo(Integer status) throws Exception {
        return null;
    }

    @Override
    public void deleteComment(Integer id) throws Exception {

    }

    @Override
    public void updateComment(Comment comment) throws Exception {

    }

    @Override
    public Integer countComment(Integer status) throws Exception {
        return null;
    }

    @Override
    public List<CommentArticleVo> listRecentComment(Integer limit) throws Exception {
        return null;
    }

    @Override
    public List<Comment> listChildComment(Integer id) throws Exception {
        return null;
    }
}
