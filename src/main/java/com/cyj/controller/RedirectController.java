package com.cyj.controller;

import com.cyj.pojo.Article;
import com.cyj.pojo.custom.ArticleListVo;
import com.cyj.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by amini on 2018/7/10.
 */
@Controller
public class RedirectController {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("user/personalPage")
    public String getPersonalPage(){
        return "user/personalPage";
    }

    @RequestMapping("/blog")
    public String getBlog(){
        return "user/blog";
    }

    @RequestMapping("/articleDetail")
    public String getArticleDetail(){
        return "user/articleDetail";
    }
    /*@RequestMapping("")
    public ModelAndView index() throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        //分页显示已发布的文章
        Integer pageSize=3;
        List<ArticleListVo> publishedArticleListVo=articleService
    }*/
    @RequestMapping("/")
    public ModelAndView index() throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        List<Article> articleList=articleService.getArticleList();
        modelAndView.addObject("articleList",articleList);
        modelAndView.setViewName("index");
        return modelAndView;
    }

}
