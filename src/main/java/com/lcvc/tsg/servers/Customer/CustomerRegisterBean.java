package com.lcvc.tsg.servers.Customer;

import com.lcvc.tsg.OtherPackage.MyMD5;
import com.lcvc.tsg.dao.CustomerDao.CustomerRegisterDao;
import com.lcvc.tsg.model.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @ClassName CustomerRegisterBean
 * @Author Anle
 * @Date 2018/10/16 0016 上午 11:22
 * * ---------------------------------------这个bean只是单纯用来注册用户-----------------------------
 * @Version 1.0
 **/
@Service
public class CustomerRegisterBean {
    @Resource
    private CustomerRegisterDao crd;

    /**
     * @Author Anle
     * @Date 上午 11:25 2018/10/16 0016
     **/
    //=============================== 查看某个用户名有没有被使用过于 ==================================
    public int VerificationUserName(String UserName) {

        return crd.VerificationUserName(UserName);
    }

    /**
     * @Author Anle
     * @Date 下午 7:51 2018/10/16 0016
     **/
    //==================================== 用户注册 ==================================================
    public int Customer_register(Customer customer) {
        MyMD5 md5 = new MyMD5();
        customer.setId(null);
        customer.setCustomer_sex(false);
        customer.setCustomer_nickname(customer.getCustomer_name());
        customer.setCustomer_prohibit_Borrowing(false);
        customer.setCustomer_prohibit_Login(false);
        customer.setCustomer_password(md5.MD5(customer.getCustomer_password()));//加密
        return crd.Customer_register(customer);
    }

}
