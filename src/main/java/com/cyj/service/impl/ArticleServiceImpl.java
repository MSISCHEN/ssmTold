package com.cyj.service.impl;

import com.cyj.dao.ArticleMapper;
import com.cyj.dao.CollectionsMapper;
import com.cyj.dao.CommentMapper;
import com.cyj.dao.UserMapper;
import com.cyj.pojo.Article;
import com.cyj.pojo.User;
import com.cyj.pojo.custom.*;
import com.cyj.service.ArticleService;
import com.cyj.service.UserService;
import com.cyj.utils.others.Page;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by amini on 2018/7/13.
 */
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CollectionsMapper collectionsMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public ArticleCustom selectByPrimaryKey(int articleId) throws Exception {
        return articleMapper.selectByPrimaryKey(articleId);
    }

    @Override
    public void updateByPrimaryKeySelective(ArticleCustom articleCustom) {
        articleMapper.updateByPrimaryKeySelective(articleCustom);
    }

    @Override
    public List<ArticleCustom> getArticleListBySearchKey(Integer articleStatus, String searchKey) throws Exception {
        List<ArticleCustom> articleCustoms= articleMapper.getArticleListBySearchKey(articleStatus,searchKey);
        for(int i=0;i<articleCustoms.size();i++){
            ArticleCustom articleCustom=articleCustoms.get(i);
            articleCustom.setCollectionNum(collectionsMapper.getArticleCollectionNum(articleCustom.getArticleId()));
            articleCustom.setCommentNum(commentMapper.getCommentNumByArticleId(articleCustom.getArticleId()));
        }
        return articleCustoms;
    }

    @Override
    public void updateStates(Integer articleId, Integer articleStatus) throws Exception {
        articleMapper.updateStates(articleId,articleStatus);
    }

    @Override
    public List<ArticleCustom> selectArticleListByUserId(Integer userId) throws Exception {
        return articleMapper.selectArticleListByUserId(userId);
    }

    @Override
    public void deleteByPrimaryKey(int articleId) throws Exception {
        articleMapper.deleteByPrimaryKey(articleId);
    }

    @Override
    public void updateArticleLikeNum(int articleId) throws Exception {
        articleMapper.updateArticleLikeNum(articleId);
    }

    @Override
    public Integer getArticleCount(Integer status) throws Exception {
        return articleMapper.getArticleCount(status);
    }


    @Override
    public List<ArticleCustom> getArticleList() throws Exception {
        List<ArticleCustom> articleCustoms= articleMapper.getArticleList();
        for(int i=0;i<articleCustoms.size();i++){
            ArticleCustom articleCustom=articleCustoms.get(i);
            articleCustom.setCollectionNum(collectionsMapper.getArticleCollectionNum(articleCustom.getArticleId()));
            articleCustom.setCommentNum(commentMapper.getCommentNumByArticleId(articleCustom.getArticleId()));
        }
        return articleCustoms;
    }

    @Override
    public List<ArticleCustom> getArticleList(Integer status) throws Exception {
        List<ArticleCustom> articleCustoms= articleMapper.getArticleList(status);
        for(int i=0;i<articleCustoms.size();i++){
            ArticleCustom articleCustom=articleCustoms.get(i);
            articleCustom.setCollectionNum(collectionsMapper.getArticleCollectionNum(articleCustom.getArticleId()));
            articleCustom.setCommentNum(commentMapper.getCommentNumByArticleId(articleCustom.getArticleId()));
        }
        return articleCustoms;
    }

    @Override
    public List<ArticleListVo> getArticleListVo() throws Exception {
        List<ArticleCustom> articleCustoms=this.getArticleList();
        List<ArticleListVo> articleListVoList=null ;
        if (articleCustoms!=null) {
            articleListVoList=new ArrayList<>();
            for (int i = 0; i < articleCustoms.size(); i++) {
                ArticleCustom articleCustom=articleCustoms.get(i);
                ArticleListVo articleListVo=new ArticleListVo();
                User user = userMapper.findUserById(articleCustom.getArticleUserId());
                UserCustom userCustom = new UserCustom();
                BeanUtils.copyProperties(user, userCustom);
                articleListVo.setArticleCustom(articleCustom);
                articleListVo.setUserCustom(userCustom);
                articleListVoList.add(articleListVo);
            }
        }
        return articleListVoList;
    }

    @Override
    public List<ArticleCustom> getArticleListByCast(String cast,Integer status) throws Exception {
        List<ArticleCustom> articleCustoms=articleMapper.getArticleListByCast(cast,status);
        if (articleCustoms!=null){
            for(int i=0;i<articleCustoms.size();i++){
                ArticleCustom articleCustom=articleCustoms.get(i);
                articleCustom.setCollectionNum(collectionsMapper.getArticleCollectionNum(articleCustom.getArticleId()));
                articleCustom.setCommentNum(commentMapper.getCommentNumByArticleId(articleCustom.getArticleId()));
            }
        }
        return articleCustoms;
    }

    @Override
    public List<ArticleListVo> getArticleListVo(Integer status) throws Exception {
        List<ArticleCustom> articleCustoms=this.getArticleList(status);
        List<ArticleListVo> articleListVoList=null ;
        if (articleCustoms!=null) {
            articleListVoList=new ArrayList<>();
            for (int i = 0; i < articleCustoms.size(); i++) {
                ArticleCustom articleCustom=articleCustoms.get(i);
                ArticleListVo articleListVo=new ArticleListVo();
                User user = userMapper.findUserById(articleCustom.getArticleUserId());
                UserCustom userCustom = new UserCustom();
                BeanUtils.copyProperties(user, userCustom);
                articleListVo.setArticleCustom(articleCustom);
                articleListVo.setUserCustom(userCustom);
                articleListVoList.add(articleListVo);
            }
        }
        return articleListVoList;
    }

    @Override
    public ArticleDetailVo getArticleDetailById(Integer articleId) throws Exception {

        ArticleDetailVo articleDetailVo=new ArticleDetailVo();
        //1、获取文章信息
        ArticleCustom articleCustom=articleMapper.selectByPrimaryKey(articleId);
        articleCustom.setCommentNum(commentMapper.getCommentNumByArticleId(articleId));
        if(articleCustom==null){
            return null;
        }
        articleDetailVo.setArticleCustom(articleCustom);
        //2、获取作者信息
        Integer userId=articleCustom.getArticleUserId();
        User user=userMapper.findUserById(userId);
        UserCustom userCustom=new UserCustom();
        BeanUtils.copyProperties(user,userCustom);
        articleDetailVo.setUserCustom(userCustom);

        //3、获取评论信息列表
        List<CommentCustom> commentCustomList=commentMapper.selectByArticleId(articleId);
        //给每个评论用户添加头像

        articleDetailVo.setCommentCustomList(commentCustomList);

        return articleDetailVo;

    }

    @Override
    public int insertArticle(Article article) throws Exception {
        return articleMapper.insertArticle(article);
    }

    //根据文章的id得到文章和用户的信息。
    public UserArticleCustom getUserArticleById(Integer articleId) throws Exception{
        UserArticleCustom userArticleCustom=null;
        Article article=articleMapper.selectByPrimaryKey(articleId);
        if (article!=null&&article.getArticleId()!=0){
            userArticleCustom=new UserArticleCustom();
            userArticleCustom.setArticle(article);
            User user= userMapper.findUserById(article.getArticleUserId());
            userArticleCustom.setUser(user);
        }

        return userArticleCustom;
    }
}
