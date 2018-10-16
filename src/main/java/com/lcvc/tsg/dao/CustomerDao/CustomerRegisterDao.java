package com.lcvc.tsg.dao.CustomerDao;

import com.lcvc.tsg.model.Customer;

/**
 * @Author Anle
 * @Date 下午 11:52 2018/10/15 0015
 * ---------------------------------------这个Dao只是单纯用来注册用户-----------------------------
 **/
public interface CustomerRegisterDao {
    /*
     * @Author Anle
     * @Date 上午 12:02 2018/10/16 0016
     **/
    //=============================== 查看某个用户名有没有被使用过于 ==================================
  int  VerificationUserName(String UserName);
  /**
   * @Author Anle
   * @Date 下午 7:51 2018/10/16 0016
   **/
    //==================================== 用户注册 ==================================================
    int Customer_register(Customer customer);
}
