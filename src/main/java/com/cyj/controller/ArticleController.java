package com.cyj.controller;

import com.cyj.pojo.Article;
import com.cyj.pojo.custom.*;
import com.cyj.service.ArticleService;
import com.cyj.service.CollectionsService;
import com.cyj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @Autowired
    CommentService commentService;

    @Autowired
    CollectionsService collectionsService;
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
    //更新文章
    @RequestMapping("/updateArticle")
    public  String updateArticle(ArticleCustom articleCustom) throws Exception{
        articleCustom.setArticleUpdateTime(new Date());
        articleCustom.setArticleStatus(0);
        articleService.updateByPrimaryKeySelective(articleCustom);
        return "redirect:findBlog/"+articleCustom.getArticleId();
    }

    //根据文章id得到文章
    @RequestMapping("/findBlog/{articleId}")
    public ModelAndView findBlog(@PathVariable int articleId) throws Exception{
        ModelAndView modelAndView=new ModelAndView();
//        文章信息，作者，评论
        ArticleDetailVo articleDetailVo=articleService.getArticleDetailById(articleId);

        if(articleDetailVo!=null){
            modelAndView.addObject("articleDetailVo",articleDetailVo);
            int num= collectionsService.getArticleCollectionNum(articleId);
            modelAndView.addObject("collectionNum",num);
            modelAndView.setViewName("user/articleDetail");
        }else {
            modelAndView.setViewName("Error/404");
        }

       /* UserArticleCustom userArticleCustom=articleService.getUserArticleById(articleId);
        List<CommentCustom> commentCustoms=commentService.listCommentByArticleId(articleId);
        modelAndView.addObject("userArticleCustom",userArticleCustom);
        modelAndView.setViewName("user/articleDetail");
//        System.out.print(article);
*/
        return modelAndView;
    }
    //增加点赞
    @RequestMapping("/updateArticleLikeNum/{articleId}")
    public void updateArticleLikeNum(@PathVariable int articleId) throws Exception{
        articleService.updateArticleLikeNum(articleId);
    }

    //根据主键删除文章
    @RequestMapping("/deleteArticleById/{articleId}")
    public void deleteByPrimaryKey (@PathVariable int articleId) throws Exception{
        if(articleId!=0){
            commentService.deleteComment(articleId);
            collectionsService.deleteCollectionById(articleId);
            articleService.deleteByPrimaryKey(articleId);
        }else{

        }

    }


}
