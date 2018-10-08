package com.lcvc.tsg.servers.Admin;


import com.lcvc.tsg.dao.AdminDao.CustomerDao;
import com.lcvc.tsg.model.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName CustomerBean
 * @Author Anle
 * @Date 2018/10/8 0008 上午 10:05
 * @Version 1.0
 **/
@Service
public class CustomerBean {
    @Resource
    private CustomerDao customerDao;
    //=============================== 查看客户（分页）==============================
    public List<Customer> CustomerShow(int index) {//展示客户
        index = index * 10;  //按10个
        return customerDao.CustomerShow(index);
    }

    //=============================== 查看客户总数==================================
    public int CustomerCount() {

        return customerDao.CustomerCount();
    }
    // ================================== 查看客户详情==============================
    public Customer getCustomer(int Customer_id){

        return customerDao.getCustomer(Customer_id);
    }
}
