package com.cyj.service.impl;

import com.cyj.dao.UserMapper;
import com.cyj.pojo.User;
import com.cyj.pojo.UserLogin;
import com.cyj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by amini on 2018/7/1.
 */
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User findUserById(int id) throws Exception {
        //通过mapper查询数据库
        return userMapper.findUserById(id);
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
    public void insertUser(User user) throws Exception {
        userMapper.insertUser(user);
    }

    @Override
    public User findUserLogin(UserLogin userLogin) throws Exception {
        return userMapper.findUserLogin(userLogin);
    }
}
