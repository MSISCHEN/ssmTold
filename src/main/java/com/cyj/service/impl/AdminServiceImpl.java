package com.cyj.service.impl;

import com.cyj.dao.AdminMapper;
import com.cyj.pojo.Admin;
import com.cyj.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by amini on 2018/8/6.
 */
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Override
    public Integer selectAdmin(Admin admin) throws Exception {
        return adminMapper.selectAdmin(admin);
    }
}
