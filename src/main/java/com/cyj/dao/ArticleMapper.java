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

    //新增文章
    public int insertArticle(Article article)throws Exception;

    //根据主键查找文章
    public Article selectByPrimaryKey(int articleId)throws Exception;

    //获取文章总数
    public Integer countArticle(@Param(value="status") Integer status) throws Exception;

    //分页操作
    public List<ArticleCustom> listArticleByPage(@Param(value="status") Integer status, @Param(value="startPos") Integer startPos, @Param(value="pageSize") Integer pageSize) throws Exception;

    //获取文章列表
    public List<Article> getArticleList() throws Exception;

    /*//根据文章的id得到文章和用户的信息。
    public UserArticleCustom getUserArticleById(Integer articleId) throws Exception;
*/
}
