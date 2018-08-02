package com.cyj.controller;

import com.cyj.pojo.User;
import com.cyj.pojo.custom.ArticleCustom;
import com.cyj.pojo.custom.CollectionsCustom;
import com.cyj.service.ArticleService;
import com.cyj.service.CollectionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by amini on 2018/7/25.
 */
@Controller
@RequestMapping("/collection")
public class CollectionsController {
    @Autowired
    CollectionsService collectionsService;

    @Autowired
    ArticleService articleService;

    @RequestMapping("/insertCollection")
    @ResponseBody
    public Integer insertCollection(CollectionsCustom collectionsCustom) throws Exception{
        if(collectionsCustom!=null&&collectionsCustom.getCollectionUserId()!=null) {
            collectionsCustom.setCollectionCreateTime(new Date());
            collectionsService.insertCollection(collectionsCustom);
            return 1;
        }else {
            return null;
        }
    }

    @RequestMapping("/selectCollection")
    @ResponseBody
    public Integer selectCollection(CollectionsCustom collectionsCustom) throws Exception{
        Integer num=0;
        num=collectionsService.selectCollection(collectionsCustom);
        System.out.println(num);
        return num;
    }

    /*@RequestMapping("/getCollectionArticleList/{userId}")
    public ModelAndView getCollectionArticleList(@PathVariable int userId)throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        List<Integer> articleIdList=collectionsService.getArticleIdListByUserId(userId);
        List<ArticleCustom> articleList=new ArrayList<>(articleIdList.size());
        if(articleIdList.size()>0){
            for(int i=0;i<articleIdList.size();i++){
                articleList.add(articleService.selectByPrimaryKey(articleIdList.get(0)));
            }
            modelAndView.addObject("articleList",articleList);
        }



        return modelAndView;
    }*/

    //取消收藏
    @RequestMapping("/deleteCollection/{articleId}")
    public void deleteCollection(HttpServletRequest httpServletRequest, @PathVariable int articleId) throws Exception{
        User user=(User)httpServletRequest.getSession().getAttribute("user");
        int userId=0;
        if(user!=null){
            userId=user.getId();
        }
        CollectionsCustom collectionsCustom=new CollectionsCustom();
        collectionsCustom.setCollectionArticleId(articleId);
        collectionsCustom.setCollectionUserId(userId);
        collectionsService.deleteCollection(collectionsCustom);
    }
}
