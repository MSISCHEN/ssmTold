package com.cyj.service.impl;

import com.cyj.dao.ArticleMapper;
import com.cyj.dao.UserMapper;
import com.cyj.pojo.Article;
import com.cyj.pojo.User;
import com.cyj.pojo.custom.ArticleCustom;
import com.cyj.pojo.custom.ArticleListVo;
import com.cyj.pojo.custom.UserArticleCustom;
import com.cyj.service.ArticleService;
import com.cyj.service.UserService;
import com.cyj.utils.others.Page;
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

    @Override
    public Article selectByPrimaryKey(int articleId) throws Exception {
        return articleMapper.selectByPrimaryKey(articleId);
    }

    @Override
    public List<ArticleListVo> listArticleByPage(Integer status, Integer pageNo, Integer pageSize) throws Exception {
        List<ArticleListVo> articleListVoList = new ArrayList<ArticleListVo>();
        //获得文章列表信息和分页信息
        List<ArticleCustom> articleCustomList = new ArrayList<ArticleCustom>();
        Page page = null;
        int totalCount = articleMapper.countArticle(status);
        if (pageNo != null) {
            page = new Page(totalCount, pageNo,pageSize);
            articleCustomList = articleMapper.listArticleByPage(status,page.getStartPos(),pageSize);
        } else {
            page = new Page(totalCount, 1,pageSize);
            articleCustomList = articleMapper.listArticleByPage(status,page.getStartPos(), pageSize);
        }
        return null;
    }

    @Override
    public List<Article> getArticleList() throws Exception {
        return articleMapper.getArticleList();
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
