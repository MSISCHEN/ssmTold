package com.cyj.controller;

import com.cyj.pojo.User;
import com.cyj.pojo.UserLogin;
import com.cyj.service.UserService;
import com.cyj.utils.phone.IndustrySMS;
import com.mysql.fabric.xmlrpc.base.Data;
import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.UUID;

/**
 * Created by amini on 2018/7/1.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    //根据用户i的查询用户
    @RequestMapping("/findUserById/{id}")
    @ResponseBody
    public User findUserById(@PathVariable int id) throws Exception{
        return userService.findUserById(id);
    }
/*

    @RequestMapping("/login_register")
    public String getLoginRegister(){

        return "user/loginRegister";
    }
*/

    //更新用户
    @RequestMapping("/updateUser")
    public String updateUser(HttpServletRequest request, String birthday, String uname, User user) throws Exception{
        if (user!=null){
            user.setName(uname);
            user.setBirthday(birthday);
            userService.updateUser(user);

            request.getSession().removeAttribute("user");
            request.getSession().setAttribute("user",userService.findUserById(user.getId()));
        }
        return "redirect:personalPage/"+user.getId();
    }

    //更改用户头像
    @RequestMapping("/eidtorHeadImg")
    public String eidtorHeadImg(HttpServletRequest request, MultipartFile file, int userId) throws Exception {
        //定义文件保存的本地路径
        String localPath = request.getServletContext().getRealPath("/");
        User user=(User)request.getSession().getAttribute("user");
        if (user!=null &&file!=null) {
            if (user.getHeadImg()!=null){
                String oldfilename=localPath+"//"+user.getHeadImg();
                File file1=new File(oldfilename);
                file1.delete();
            }
            //保存数据库的路径
            String sqlPath = null;
            //定义文件名
            String fileName = null;
                //生成uuid作为文件名
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            String contentType = file.getContentType();
            //获取文件后缀名
            String suffixName = contentType.substring(contentType.indexOf("/") + 1);
            //得到文件名
            fileName = uuid + "." + suffixName;
            System.out.println(fileName);
            //文件保存路径
            file.transferTo(new File(localPath + "static/images/" + fileName));
            //把图片的相对路径保存至数据库
            sqlPath="static/images/"+fileName;
            System.out.println(localPath + "static/images/" + fileName);
            System.out.println(localPath);
            userService.updateHeadImg(userId,sqlPath);
            user.setHeadImg(sqlPath);
            request.getSession().setAttribute("user",user);
        }
        return "redirect:/user/personalPage/"+userId;

    }

    //用户注册
    @RequestMapping("/insertUser")
    public String insertUser(HttpServletRequest request,User user)throws Exception{
        if (user.getEmail()!=null||user.getPhone()!=null){
            String name= UUID.randomUUID().toString();
            name=name.replace("-","");
            user.setName(name);
            userService.insertUser(user);
            request.getSession().setAttribute("user",user);

            return "user/personalPage";
        }

        return "redirect:/index.jsp";
    }

    //查看用户名是否已经被注册了
    @RequestMapping("/editorName")
    @ResponseBody
    public Integer editorName(String name,int id) throws Exception{
        Integer result=userService.editorName(name);
        if(result!=null&&result!=id){
            result=1;
        }else{
            result=0;
        }
        System.out.println(result);
        return result;
    }


    //用户登陆
    @RequestMapping("/findUserLogin")
    @ResponseBody
    public boolean findUserLogin(HttpServletRequest request, UserLogin userLogin)throws Exception{
        String loginNum=userLogin.getLoginNum();
        if(loginNum.matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+")) {
            userLogin.setEmail(loginNum);
        }else{
            userLogin.setPhone(loginNum);
        }
        User user=userService.findUserLogin(userLogin);
        if(user!=null&&user.getId()>0){
            request.getSession().setAttribute("user",user);
            return true;
        }else {
            return false;
        }
    }

    //退出登陆
    @RequestMapping("/logout")
    public String logout(HttpSession session)throws Exception{
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/";
    }


    //发送手机验证码
    @RequestMapping("/findPhone")
    public void findPhone(String phoneNumber) throws Exception{
        // 短信验证
        IndustrySMS.execute(phoneNumber);
    }
}
