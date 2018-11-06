package bean;

import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Customer.CustomerRegisterBean;
import com.lcvc.tsg.servers.Customer.CustomerUserBean;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * @ClassName CustomerBeanTest
 * @Author Anle
 * @Date 2018/10/16 0016 上午 11:27
 * @Version 1.0
 **/
public class CustomerBeanTest extends SpringJunitTest {

    @Resource
    private CustomerRegisterBean customerRegisterBean;
    @Resource
    CustomerUserBean customerUserBean;
    @Test
    public void VerificationUserName() {//用没用人使用过用户名
        System.out.println(customerRegisterBean.VerificationUserName("o1"));

    }
    @Test
    public void Customer_register_Test(){
        Customer customer = new Customer();
        customer.setCustomer_name("javac");
        customer.setCustomer_password("123");
        customer.setCustomer_Email("1742892917@qq.com");
      System.out.println(customerRegisterBean.Customer_register(customer));

    }
@Test
    public void fdsf(){
        customerUserBean.selectCollectionWhereUser(21,0);

}

}
