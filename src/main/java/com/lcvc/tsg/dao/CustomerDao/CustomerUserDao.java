package com.lcvc.tsg.dao.CustomerDao;

import com.lcvc.tsg.model.Customer;
import org.apache.ibatis.annotations.Param;

public interface CustomerUserDao {
    //=============================== 查看用户详情(通过id)=============================

    Customer getCustomer(int id);

    //=============================== 修改用户密码=============================
    public int updatePassword(@Param(value = "id") Integer id, @Param(value = "customer_password") String customer_password);

    //=============================== 修改用户基本信息=============================
    int updateCustomer(Customer customer);

    //=============================== 查看用户昵称有没有重名 ==================================
    int UserRename(String UserName);

    //================================查看用户详情(通过用户名)=============================
    Customer getCustomer_whereCustomerName(String CustomerName);

}


