package com.lcvc.tsg.dao.LoginDao;

import com.lcvc.tsg.model.Admin;
import org.apache.ibatis.annotations.Param;

public interface LoginDao {
    //-----------------------------------------管理员登录---------------------------------
    Admin AdminLogin(@Param(value="admin_name")String AdminName, @Param(value="admin_password")String AdminPassWord);

}
