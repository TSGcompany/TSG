package com.lcvc.tsg.dao.CustomerDao;

import com.lcvc.tsg.model.Customer;
import org.apache.ibatis.annotations.Param;

public interface CustomerUserDao {
    //=============================== 查看用户详情=============================

    Customer getCustomer(int id);

    //=============================== 修改用户密码=============================
    public int updatePassword(@Param(value = "id") Integer id, @Param(value = "customer_password") String customer_password);
    //=============================== 修改用户基本信息=============================

    int userupdateubase(Customer customer);
    //=============================== 查看用户昵称有没有重名 ==================================
    int UserRename(String UserName);
}
