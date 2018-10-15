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

    //=============================== 查看管理员有没有重名 ==================================
    int Rename (String AdminName);

    //=============================== 查看管理员==========================
    List<Admin> AdminShow(int index);//展示所有用户

    //=============================== 查看管理员总数用于分页 ==============================
    int AdminCount();

    //===============================添加管理员===========================================
    int AddAdmin(Admin admin);

    //===============================删除管理员===========================================
    int deleteAdmin(int id);
}
