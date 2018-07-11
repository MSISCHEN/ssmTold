package com.cyj.dao;

import com.cyj.pojo.User;
import com.cyj.pojo.UserLogin;
import org.springframework.stereotype.Repository;

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

    //注册用户
    public void insertUser(User user) throws Exception;

    //查找邮箱是否已被注册
    public User findEmail(String email) throws Exception;

    //查找手机号码是否已被注册
    public User findPhone(String phone) throws Exception;

    //登陆
    public User findUserLogin(UserLogin userLogin) throws Exception;

}
