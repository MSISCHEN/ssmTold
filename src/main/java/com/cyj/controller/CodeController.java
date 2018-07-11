package com.cyj.controller;

//import com.cyj.pojo.RegisterMessage;
import com.cyj.pojo.User;
import com.cyj.service.UserService;
import com.cyj.utils.email.Email;
import com.cyj.utils.phone.IndustrySMS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by amini on 2018/7/3.
 */
@Controller
@RequestMapping("/code")
public class CodeController {
    @Autowired
    private UserService userService;

//    private RegisterMessage registerMessage=new RegisterMessage();
    //发送手机验证码
    @RequestMapping("/findPhone")
    @ResponseBody
    public String findPhone(String phone) throws Exception{
        // 短信验证
        String code= IndustrySMS.execute(phone);
       /*
        */
        System.out.println("手机验证码为：----"+code);
        return code;
    }
    //查看手机号码是否被注册过
    @RequestMapping("/findPhoneIsExist")
    @ResponseBody
    public boolean findPhoneIsExist(String phone)throws Exception{
        boolean isExist=false;
        User user=userService.findPhone(phone);
        if (user!=null&&user.getPhone().equals(phone)){
            isExist=true;
        }else{
            isExist=false;
        }
        return isExist;
    }

    //邮箱号码有效性验证和是否存在
    @RequestMapping("/findEmailIsExist")
    @ResponseBody
    public boolean findValid(String email) throws Exception{
        if(email!=null) {
            User user = userService.findEmail(email);
            if (user != null && user.getEmail().equals(email)) {
                return true;
            }
        }
            return false;
    }
    //获取邮箱验证码
    @RequestMapping("/findEamilCode")
    @ResponseBody
    public String findEamilCode(String email) throws Exception{
        /*String code;
        try {
            code = Email.sendEmail(email);
        }catch (Exception e){
            code="";
            System.out.print("出错了，你的邮箱不存在哦！！！："+e);
        }
        return code;*/
        String code;
        try {
            code= Email.sendEmail(email);
        }catch (Exception e){
            code="";
            System.out.print("出错了，你的邮箱不存在哦！！！："+e);
        }
        System.out.print("邮箱验证码为：" + code);
        return code;
    }

    //登陆时检查邮箱或者手机号码是否是数据库里面的
    @RequestMapping("/findLoginNum")
    @ResponseBody
    public boolean findLoginNum(String loginNum) throws Exception{
        boolean isExist=true;
        if(loginNum.matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+")) {
            User user = userService.findEmail(loginNum);
            if (user != null && user.getEmail().equals(loginNum)) {
                isExist = true;
            } else {
                isExist = false;
            }
        }else{
            User user=userService.findPhone(loginNum);
            if (user!=null&&user.getPhone().equals(loginNum)){
                isExist=true;
            }else{
                isExist=false;
            }
        }
        return isExist;
    }
}
