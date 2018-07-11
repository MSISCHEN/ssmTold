package com.cyj.controller;

import com.cyj.pojo.User;
import com.cyj.pojo.UserLogin;
import com.cyj.service.UserService;
import com.cyj.utils.phone.IndustrySMS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
        return "redirect:/index.jsp";
    }


    //发送手机验证码
    @RequestMapping("/findPhone")
    public void findPhone(String phoneNumber) throws Exception{
        // 短信验证
        IndustrySMS.execute(phoneNumber);
    }
}
