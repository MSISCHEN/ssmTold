package com.cyj.controller;

import com.cyj.pojo.custom.ArticleCustom;
import com.cyj.pojo.custom.ArticleListVo;
import com.cyj.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by amini on 2018/8/1.
 */
@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @Autowired
    ArticleService articleService;

    @RequestMapping("/index")
    public String index(){
        System.out.print(" hjhkf ");

        return "admin/index";
    }

    @RequestMapping("/articleList")
    public ModelAndView getArticleList() throws Exception{
        List<ArticleListVo> articleListVoList= articleService.getArticleListVo();
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.addObject("articleListVoList",articleListVoList);
        modelAndView.setViewName("admin/articleList");
        return modelAndView;
    }
}
