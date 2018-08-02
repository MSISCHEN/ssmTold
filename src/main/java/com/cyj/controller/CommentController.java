package com.cyj.controller;

import com.cyj.pojo.Comment;
import com.cyj.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by amini on 2018/7/16.
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/insertComment")
    @ResponseBody
    public int insertComment(Comment com) throws Exception{
        int commentId=0;
        if(com!=null&&com.getCommentContent().trim().length()!=0){
//            com.setCommentCreateTime(new Date());
            com.setCommentStatus(0);
            commentService.insertComment(com);
            commentId=com.getCommentId();
        }
        return commentId;
    }

}
