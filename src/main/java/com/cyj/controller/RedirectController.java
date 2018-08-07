package com.cyj.controller;

import com.cyj.pojo.Article;
import com.cyj.pojo.custom.ArticleCustom;
import com.cyj.pojo.custom.ArticleListVo;
import com.cyj.service.ArticleService;
import com.cyj.service.CollectionsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by amini on 2018/7/10.
 */
@Controller
public class RedirectController {
    @Autowired
    private ArticleService articleService;

    @Autowired
    CollectionsService collectionsService;


    @RequestMapping("user/personalPage/{userId}")
    public ModelAndView getPersonalPage(HttpServletRequest request, @PathVariable Integer userId) throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        if(request.getSession().getAttribute("user")!=null) {
            modelAndView.addObject("articleListByUserId", articleService.selectArticleListByUserId(userId));

            List<Integer> articleIdList=collectionsService.getArticleIdListByUserId(userId);
            List<ArticleCustom> articleList=new ArrayList<>(articleIdList.size());
            if(articleIdList.size()>0){
                for(int i=0;i<articleIdList.size();i++){
                    articleList.add(articleService.selectByPrimaryKey(articleIdList.get(i)));
                }
                modelAndView.addObject("articleList",articleList);
            }

            modelAndView.setViewName("user/personalPage");
        }else{
            modelAndView.setViewName("redirect:/");
        }
        return modelAndView;
    }

    @RequestMapping("/blog")
    public String getBlog(){
        return "user/blog";
    }

    @RequestMapping("/editorBlog/{articleId}")
    public ModelAndView editorBlog(@PathVariable int articleId) throws Exception{
        ArticleCustom articleCustom=articleService.selectByPrimaryKey(articleId);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("articleCustom",articleCustom);
        modelAndView.setViewName("user/blog");
        return modelAndView;
    }

    @RequestMapping("/articleDetail")
    public String getArticleDetail(){
        return "user/articleDetail";
    }

    @RequestMapping("/")
    public ModelAndView index() throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(1,5);
        List<ArticleCustom> articleList=articleService.getArticleList();
        PageInfo<ArticleCustom> articleLists=new PageInfo<>(articleList);
        modelAndView.addObject("articleList",articleLists);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/admin")
    public String admin() throws Exception{
        return "admin/login";
    }

    @RequestMapping("p/{pageNow}")
    public ModelAndView articleListByPageView(@PathVariable int pageNow) throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage((pageNow-1)*5,5);
        List<ArticleCustom> articleList=articleService.getArticleList();
        PageInfo<ArticleCustom> articleLists=new PageInfo<>(articleList);
        modelAndView.addObject("articleList",articleLists);
        System.out.println(articleLists.toString());
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("p/{pageNow}/search")
    public ModelAndView getArticleListBySearchKey(HttpServletRequest request,@PathVariable int pageNow) throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage((pageNow-1)*5,5);
        String searchKey=request.getParameter("searchKey");
        List<ArticleCustom> articleList=articleService.getArticleListBySearchKey(pageNow,searchKey);
        PageInfo<ArticleCustom> articleLists=new PageInfo<>(articleList);
        modelAndView.addObject("articleList",articleLists);
        modelAndView.addObject("searchKey",searchKey);
        System.out.println(articleLists.toString());
        modelAndView.setViewName("index");
        return modelAndView;
    }

}
