package com.cyj.controller;

import com.cyj.pojo.Article;
import com.cyj.pojo.custom.UserArticleCustom;
import com.cyj.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * Created by amini on 2018/7/13.
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    ArticleService articleService;

    //新增文章
    @RequestMapping("/insertArticle")
    public  String insertArticle(Article article) throws Exception{
        article.setArticlePostTime(new Date());
        article.setArticleUpdateTime(new Date());
        article.setArticleLikeNum(0);
        article.setArticleStatus(0);
        articleService.insertArticle(article);
        int articleId=article.getArticleId();
        return "redirect:findBlog/"+articleId;
    }

    //根据文章id得到文章
    @RequestMapping("/findBlog/{articleId}")
    public ModelAndView findBlog(@PathVariable int articleId) throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        UserArticleCustom userArticleCustom=articleService.getUserArticleById(articleId);
        modelAndView.addObject("userArticleCustom",userArticleCustom);
        modelAndView.setViewName("user/articleDetail");
//        System.out.print(article);

        return modelAndView;
    }

}
