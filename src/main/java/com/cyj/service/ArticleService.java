package com.cyj.service;

import com.cyj.pojo.Article;
import com.cyj.pojo.custom.ArticleListVo;
import com.cyj.pojo.custom.UserArticleCustom;

import java.util.List;

/**
 * Created by amini on 2018/7/13.
 */
public interface ArticleService {

    //新增文章
    public int insertArticle(Article article) throws Exception;

    //根据主键查找文章
    public Article selectByPrimaryKey(int articleId)throws Exception;

    //分页显示文章
    public List<ArticleListVo> listArticleByPage(Integer status,Integer pageNo,Integer pageSize) throws Exception;

    //获取文章列表
    public List<Article> getArticleList() throws Exception;

    //根据文章的id得到文章和用户的信息。
    public UserArticleCustom getUserArticleById(Integer articleId) throws Exception;
}
