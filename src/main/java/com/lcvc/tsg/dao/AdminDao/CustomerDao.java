package com.lcvc.tsg.dao.AdminDao;

import com.lcvc.tsg.model.Customer;

import java.util.List;

public interface CustomerDao {
    //=============================== 查看客户（分页）==========================
    List<Customer> CustomerShow(int index);//展示所有用户

    /**
     * @Author Anle
     * @Date 下午 12:05 2018/10/5 0005
     **/
    //--=============================== 查看客户总数============================
    int CustomerCount();

    /**
     * @Author Anle
     * @Date 下午 2:05 2018/10/5 0005
     **/
    // <!--=============================== 查看客户详情=========================
    Customer getCustomer(int Customer_id);
    /**
     * @Author Anle
     * @Date 下午 11:37 2018/10/30 0030
     **/
    //=============================== 禁止(解除)用户登录===========================
    int prohibit_Customer_Login(Customer customer);
    /**
     * @Author Anle
     * @Date 下午 11:37 2018/10/30 0030
     **/
    //===============================禁止(解除)用户借阅===========================
    int prohibit_Customer_Borrowing(Customer customer);
}
