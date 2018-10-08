package bean;

import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Admin.AdminBean;
import com.lcvc.tsg.servers.Admin.CustomerBean;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName AdminBeanTest
 * @Author Anle
 * @Date 2018/10/3 0003 下午 4:30
 * @Version 1.0
 **/
public class AdminBeanTest extends SpringJunitTest{
    @Resource
    private AdminBean adminBean;
    @Resource
    private CustomerBean customerBean;
   @Test
    public void CustomerShowTest(){//查看分页功能是否正常
        List<Customer> list = customerBean.CustomerShow(1);//第2页
        for (Customer cu:list ) {
            System.out.println(cu.getCustomer_name());
        }

    }
    @Test
    public void CustomerCount(){//查看总个数
        int c=0;
        if(customerBean.CustomerCount()%10!=0){
            c=(customerBean.CustomerCount()/10)+1;

        }else{

            c=(customerBean.CustomerCount()/10);
        }
    System.out.println(c);

    }


}
