package dao;


import com.lcvc.tsg.dao.CustomerDao.CustomerRegisterDao;
import com.lcvc.tsg.dao.CustomerDao.CustomerUserDao;
import com.lcvc.tsg.servers.LoginBean.LoginBean;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * @ClassName CustomerDaoTest
 * @Author Anle
 * @Date 2018/10/16 0016 上午 12:05
 * @Version 1.0
 **/
public class CustomerDaoTest extends SpringJunitTest {
    @Resource
    private CustomerRegisterDao customerRegisterDao;
    @Resource
   private LoginBean loginBean;
    @Resource
    private CustomerUserDao customerUserDao;

    @Test
    public void  VerificationUserName_Test(){//看用户的用户名有没有被使用过
    System.out.println(customerRegisterDao.VerificationUserName("哦12"));

    }
    @Test
    public  void  LoginTest(){

      String c=  loginBean.CustomerLogin("anle","123").getCustomer_name();
      System.out.println(c);
    }
    //=============================== 判断是否被禁止登录 ==================================
    @Test
    public void prohibit_Login_Test (){
      System.out.println(customerUserDao.getCustomer(21).isCustomer_prohibit_Borrowing());
    }

}
