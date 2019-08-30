package com.cyj.controller;

import com.cyj.pojo.Admin;
import com.cyj.pojo.Noices;
import com.cyj.pojo.User;
import com.cyj.pojo.custom.AdminCustom;

import com.cyj.pojo.custom.ArticleListVo;
import com.cyj.service.*;
import org.apache.commons.io.FileUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by amini on 2018/8/1.
 */
@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @Autowired
    ArticleService articleService;

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @Autowired
    NoicesService noicesService;

    @Autowired
    AdminService adminService;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        if (request.getSession().getAttribute("admin")!=null) {
            AdminCustom adminCustom = new AdminCustom();
            adminCustom.setAllArticleNum(articleService.getArticleCount(null));
            adminCustom.setArticleDispassNum(articleService.getArticleCount(2));
            adminCustom.setArticlePassNum(articleService.getArticleCount(1));
            adminCustom.setCommentNum(commentService.getCommentNum());
            adminCustom.setUserNum(userService.getUserNum());

            modelAndView.addObject("adminCustom", adminCustom);
            modelAndView.setViewName("admin/index");
        }else{
            modelAndView.setViewName("redirect:/admin");
        }
        return modelAndView;
    }

    @RequestMapping("/articleList")
    public ModelAndView getArticleList() throws Exception{
//        PageHelper.startPage(1,5);
        List<ArticleListVo> articleListVoList= articleService.getArticleListVo();
//        PageInfo<ArticleListVo> articleLists=new PageInfo<>(articleListVoList);
        ModelAndView modelAndView =new ModelAndView();
//        modelAndView.addObject("articleListVoList",articleLists);
        modelAndView.addObject("articleListVoList",articleListVoList);
        modelAndView.setViewName("admin/articleList");
        return modelAndView;
    }
    @RequestMapping("/articleDoList/{articleStatus}")
    public ModelAndView getArticleDoList(@PathVariable Integer articleStatus) throws Exception{
        List<ArticleListVo> articleListVoList= articleService.getArticleListVo(articleStatus);
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.addObject("articleListVoList",articleListVoList);
        modelAndView.addObject("status",articleStatus);
        modelAndView.setViewName("admin/articleDetail");
        return modelAndView;
    }


    @RequestMapping("/updateStatus")
    public void updateStatus(Integer articleId,Integer articleStatus) throws Exception{
        System.out.println(articleId+"   "+articleStatus);
        articleService.updateStates(articleId,articleStatus);
    }


    @RequestMapping("/noiceIndex")
    public ModelAndView noiceIndex()throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        List<Noices> noicesList=noicesService.selectNoicesList();
        modelAndView.addObject("noicesList",noicesList);
        modelAndView.setViewName("admin/noiceIndex");
        return modelAndView;
    }
    @RequestMapping("/insertNoices")
    public void insertNoices(Noices noices) throws Exception{
        if(noices!=null) {
            noices.setNoiceCreateTime(new Date());
            noices.setNoiceStatus(0);
            System.out.println(noices);
            noicesService.insertNoices(noices);
        }
    }
    @RequestMapping("/updateNoicesStatus")
    public void updateNoicesStatus(Integer noiceId,Integer noiceStatus)throws Exception{
        noicesService.updateNoicesStatus(noiceId,noiceStatus);
    }
    @RequestMapping("/userIndex")
    public ModelAndView getUserList()throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        List<User> userList=userService.getUserList();
        modelAndView.addObject("userList",userList);
        modelAndView.setViewName("admin/userIndex");
        return modelAndView;
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request,Admin admin) throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        if(admin!=null) {
            Integer id = adminService.selectAdmin(admin);
            if (id != null) {
                admin.setAdminId(id);
                request.getSession().setAttribute("admin", admin);
                modelAndView.setViewName("redirect:/admin/index");
                return modelAndView;
            }
        }
        modelAndView.addObject("error", "用户名或者密码错误");
        modelAndView.setViewName("redirect:/admin");

        return modelAndView;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session)throws Exception{
        session.removeAttribute("admin");
        session.invalidate();
        return "redirect:/admin";
    }

    @RequestMapping("/import")
    public void impotr(HttpServletRequest request) throws Exception{
        //获取上传的文件
        MultipartHttpServletRequest multipart=(MultipartHttpServletRequest)request;
        MultipartFile file=multipart.getFile("upfile");
        if (file.isEmpty()){
            try{
                throw new Exception("文件不存在！");
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        InputStream in=null;
        try{
            in=file.getInputStream();
        }catch (IOException e){
            e.printStackTrace();
        }
        //数据导入
        noicesService.insertExcelInfo(in,file,0);
        in.close();
    }

    @RequestMapping("/export")
    @ResponseBody
    public String export(HttpServletRequest request,HttpServletResponse response) throws Exception{
        Map<String,Object> map=new HashMap<>();
        String filename= System.currentTimeMillis()+".xls";
        // 指定下载的文件名，浏览器都会使用本地编码，即GBK，浏览器收到这个文件名后，用ISO-8859-1来解码，然后用GBK来显示
        // 所以我们用GBK解码，ISO-8859-1来编码，在浏览器那边会反过来执行。
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("GBK"),"ISO-8859-1"));
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        XSSFWorkbook workbook=null;
        //导出Excel对象
        workbook = noicesService.exportExcelInfo();
        OutputStream output;
        try {
            output = response.getOutputStream();
            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
            bufferedOutPut.flush();
            workbook.write(bufferedOutPut);
            bufferedOutPut.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "/admin/index";
    }



}
