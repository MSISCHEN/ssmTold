package com.cyj.dao;

import com.cyj.pojo.User;
import com.cyj.pojo.UserLogin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by amini on 2018/7/1.
 * @Description 用户dao接口
 */
@Repository
public interface UserMapper {
    /*查询用户
    @parm 用户的id
    @return 用户
    * */
    public User findUserById(int id) throws Exception;

    //得到用户列表
    public List<User> getUserList()throws Exception;


    //统计用户数量
    public Integer getUserNum()throws Exception;

    //注册用户
    public void insertUser(User user) throws Exception;

    //根据用户名查询用户
    public User findUserByName(String name) throws Exception;

    //查找邮箱是否已被注册
    public User findEmail(String email) throws Exception;

    //查找手机号码是否已被注册
    public User findPhone(String phone) throws Exception;

    //登陆
    public User findUserLogin(UserLogin userLogin) throws Exception;

    //查找用户名是否被注册
    public Integer editorName(@Param("name") String name) throws Exception;

    //更新用户
    public void updateUser(User user)throws Exception;

}
