package com.cyj.service;

import com.cyj.pojo.User;
import com.cyj.pojo.UserLogin;

import java.util.List;

/**
 * Created by amini on 2018/7/12.
 */
public interface UserService {

    //得到用户列表
    public List<User> getUserList()throws Exception;

    //根据用户id查询用户
    public User findUserById(int id) throws Exception;

    //统计用户数量
    public Integer getUserNum()throws Exception;

    //注册用户
    public void insertUser(User user) throws Exception;

    //查找邮箱是否存在
    public User findEmail(String email) throws Exception;

    //查找手机号码是否已被注册
    public User findPhone(String phone) throws Exception;

    //查找用户名是否被注册
    public Integer editorName(String name) throws Exception;

    //更新用户
    public void updateUser(User user)throws Exception;

    //登陆
    public User findUserLogin(UserLogin userLogin) throws Exception;
}
