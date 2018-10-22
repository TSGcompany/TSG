package com.lcvc.tsg.servers.Customer;

import com.lcvc.tsg.dao.CustomerDao.CustomerUserDao;
import com.lcvc.tsg.model.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CustomerUserBean {
    @Resource
    private CustomerUserDao customerUserDao;

    //=============================== 查看用户详情=============================
    public Customer getCustomer(int id) {

        return customerUserDao.getCustomer(id);
    }
    //=============================== 修改用户密码=============================

    /**
     * @Author JunJi
     * @Date 2018/10/9 14:56
     **/
    public Boolean updatePassword(Integer id, String customer_password) {
        Boolean status = false;
        int i = customerUserDao.updatePassword(id, customer_password);
        if (i > 0) {
            status = true;
        }
        return status;
    }
    //=============================== 修改基本信息=============================

    public int userupdateubase(Customer customer) {

        return customerUserDao.userupdateubase(customer);
    }
    //=============================== 查看用户昵称有没有重名 ==================================
    public int UserRename(String UserName) {

        return customerUserDao.UserRename(UserName);
    }
}
