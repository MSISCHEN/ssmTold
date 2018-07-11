package com.cyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by amini on 2018/7/10.
 */
@Controller
public class RedirectController {


    @RequestMapping("user/personalPage")
    public String getPersonalPage(){
        return "user/personalPage";
    }

    @RequestMapping("/blog")
    public String getBlog(){
        return "user/blog";
    }
}
