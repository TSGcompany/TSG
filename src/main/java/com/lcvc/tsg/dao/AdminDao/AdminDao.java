package com.lcvc.tsg.dao.AdminDao;

import com.lcvc.tsg.model.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Anle
 * @Date 下午 3:25 2018/10/3 0003
 **/
public interface AdminDao {

    /**
     * @Author Anle
     * @Date 下午 5:34 2018/10/7 0007
     **/
    //=============================== 查看管理员详情=============================

    Admin getAdmin(int id);

    //=============================== 修改管理员密码=============================
    public int updatePassword(@Param(value="id")Integer id,@Param(value="admin_password") String admin_password);

    //=============================== 修改基本信息=============================

     int updateubase(Admin admin);

    //=============================== 查看管理员昵称有没有重名 ==================================
    int AdminRename (String AdminName);

}
