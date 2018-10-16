package dao;


import com.lcvc.tsg.dao.CustomerDao.CustomerRegisterDao;
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

    @Test
    public void  VerificationUserName_Test(){//看用户的用户名有没有被使用过
    System.out.println(customerRegisterDao.VerificationUserName("哦12"));

    }

}
