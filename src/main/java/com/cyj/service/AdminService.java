package com.cyj.service;

import com.cyj.pojo.Admin;

/**
 * Created by amini on 2018/8/6.
 */

public interface AdminService {

    //查找用户
    public Integer selectAdmin(Admin admin) throws Exception;
}
