package dao;

import com.lcvc.tsg.dao.LoginDao.LoginDao;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * @ClassName LoginDaoTest
 * @Author Anle
 * @Date 2018/10/8 0008 下午 8:15
 * @Version 1.0
 **/
public class LoginDaoTest extends SpringJunitTest {
    @Resource
    private  LoginDao loginDao;
    @Test
    public void AdminLogin_Test(){
    System.out.println(loginDao.AdminLogin("anle","123").getAdmin_nickname());

    }


}
