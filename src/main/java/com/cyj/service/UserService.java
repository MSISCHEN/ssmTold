package com.cyj.service;

import com.cyj.pojo.User;
import com.cyj.pojo.UserLogin;

/**
 * Created by amini on 2018/7/12.
 */
public interface UserService {

    //根据用户id查询用户
    public User findUserById(int id) throws Exception;

    //注册用户
    public void insertUser(User user) throws Exception;

    //查找邮箱是否存在
    public User findEmail(String email) throws Exception;

    //查找手机号码是否已被注册
    public User findPhone(String phone) throws Exception;

    //登陆
    public User findUserLogin(UserLogin userLogin) throws Exception;
}
