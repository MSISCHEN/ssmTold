package com.cyj.dao;

import com.cyj.pojo.Article;
import com.cyj.pojo.custom.ArticleCustom;
import com.cyj.pojo.custom.UserArticleCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by amini on 2018/7/13.
 */
public interface ArticleMapper {

    //得到分类文章
    public List<ArticleCustom> getArticleListByCast(@Param("cast") String cast,@Param("articleStatus") Integer articleStatus) throws Exception;


    //新增文章
    public int insertArticle(Article article)throws Exception;

    //根据用户的id得到文章列表
    public List<ArticleCustom> selectArticleListByUserId(Integer userId) throws Exception;

    //根据主键查找文章
    public ArticleCustom selectByPrimaryKey(int articleId)throws Exception;

    //根据主键删除文章
    public void deleteByPrimaryKey (int articleId) throws Exception;

    //更新文章
    public void updateByPrimaryKeySelective(ArticleCustom articleCustom);

    public void updateByPrimaryKey(Article record);

    //更改文章的状态
    public void updateStates(@Param("articleId") Integer articleId,@Param("articleStatus") Integer articleStatus) throws Exception;

    //查询文章
    public List<ArticleCustom> getArticleListBySearchKey(@Param("articleStatus") Integer articleStatus,@Param("searchKey")String searchKey) throws Exception;

    //增加点赞
    public void updateArticleLikeNum(@Param("articleId") int articleId) throws Exception;

    //获取文章总数
    public Integer getArticleCount(@Param(value="status") Integer status) throws Exception;

       //获取文章列表
    public List<ArticleCustom> getArticleList() throws Exception;

    //获取文章列表
    public List<ArticleCustom> getArticleList(@Param("status") Integer status) throws Exception;

}
