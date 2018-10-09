package com.lcvc.tsg.servers.LoginBean;

import com.lcvc.tsg.dao.LoginDao.LoginDao;
import com.lcvc.tsg.model.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @ClassName LoginBean
 * @Author Anle
 * @Date 2018/10/8 0008 下午 8:57
 * @Version 1.0
 **/
@Service
public class LoginBean {
    @Resource
    private LoginDao loginDao;
    //-------------------------管理员登录-----------------------
    public Admin AdminLogin(String AdminName,String AdminPassword){
        //加密
        return loginDao.AdminLogin(AdminName,AdminPassword);
    }
}
