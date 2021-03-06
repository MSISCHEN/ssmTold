package com.cyj.service;

import com.cyj.pojo.Article;
import com.cyj.pojo.custom.ArticleCustom;
import com.cyj.pojo.custom.ArticleDetailVo;
import com.cyj.pojo.custom.ArticleListVo;
import com.cyj.pojo.custom.UserArticleCustom;


import java.util.List;

/**
 * Created by amini on 2018/7/13.
 */
public interface ArticleService {

    //得到分类文章
    public List<ArticleCustom> getArticleListByCast(String cast,Integer status) throws Exception;


    //新增文章
    public int insertArticle(Article article) throws Exception;

    //根据主键查找文章
    public ArticleCustom selectByPrimaryKey(int articleId)throws Exception;

    //更新文章
    public void updateByPrimaryKeySelective(ArticleCustom articleCustom);

    //查询文章
    public List<ArticleCustom> getArticleListBySearchKey(Integer articleStatus, String searchKey) throws Exception;

    //更改文章的状态
    public void updateStates(Integer articleId,Integer articleStatus) throws Exception;


    //根据用户的id得到文章列表
    public List<ArticleCustom> selectArticleListByUserId(Integer userId) throws Exception;

    //根据主键删除文章
    public void deleteByPrimaryKey (int articleId) throws Exception;

    //增加点赞
    public void updateArticleLikeNum(int articleId) throws Exception;

    //获取文章总数
    public Integer getArticleCount(Integer status) throws Exception;


    //获取文章列表
    public List<ArticleCustom> getArticleList() throws Exception;

    public List<ArticleCustom> getArticleList(Integer status) throws Exception;


    //获取文章列表而且取得用户的信息
    public List<ArticleListVo> getArticleListVo() throws Exception;

    //获取文章列表而且取得用户的信息
    public List<ArticleListVo> getArticleListVo(Integer status) throws Exception;

    //显示文章的信息和评论列表和作者信息
    public ArticleDetailVo getArticleDetailById(Integer articleId) throws Exception;

    //根据文章的id得到文章和用户的信息。
    public UserArticleCustom getUserArticleById(Integer articleId) throws Exception;
}
