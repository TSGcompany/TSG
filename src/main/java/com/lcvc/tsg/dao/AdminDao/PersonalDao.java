package com.lcvc.tsg.dao.AdminDao;

import com.lcvc.tsg.model.Admin;

import java.util.List;

public interface PersonalDao {
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
