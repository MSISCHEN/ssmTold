package com.cyj.service.impl;

import com.cyj.dao.UserMapper;
import com.cyj.pojo.User;
import com.cyj.pojo.UserLogin;
import com.cyj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by amini on 2018/7/1.
 */
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getUserList() throws Exception {
        return userMapper.getUserList();
    }

    @Override
    public User findUserById(int id) throws Exception {
        //通过mapper查询数据库
        return userMapper.findUserById(id);
    }

    @Override
    public Integer getUserNum() throws Exception {
        return userMapper.getUserNum();
    }

    @Override
    public void updateHeadImg(int userId, String headImg) throws Exception {
        userMapper.updateHeadImg(userId,headImg);
    }

    @Override
    public User findEmail(String email) throws Exception {
        return userMapper.findEmail(email);
    }

    @Override
    public User findPhone(String phone) throws Exception {
        return userMapper.findPhone(phone);
    }

    @Override
    public Integer editorName(String name) throws Exception {
        return userMapper.editorName(name);
    }

    @Override
    public void updateUser(User user) throws Exception {
        userMapper.updateUser(user);
    }

    @Override
    public void insertUser(User user) throws Exception {
        userMapper.insertUser(user);
    }

    @Override
    public User findUserLogin(UserLogin userLogin) throws Exception {
        return userMapper.findUserLogin(userLogin);
    }
}
