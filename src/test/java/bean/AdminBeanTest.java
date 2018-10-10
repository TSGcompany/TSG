package bean;

import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;
import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Admin.AdminBean;
import com.lcvc.tsg.servers.Admin.BookBean;
import com.lcvc.tsg.servers.Admin.CustomerBean;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

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

    @Resource
    private BookBean bookBean;
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
    /**
     * @Author Anle
     * @Date 上午 10:25 2018/10/10 0010 TSG201827246701
     **/
    //===============================添加书籍===========================================
    @Test
    public  void AddBook(){
        int length=5;//12位随机数
        String base = "0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        //获取时间
        SimpleDateFormat sdf=new SimpleDateFormat("mmssSSS");

        String str=sdf.format(new Date());

        Book book = new Book();
        Admin admin = new Admin();
        Book_Type type = new Book_Type();
        type.setId(2);
        admin.setId(3);
        book.setId(null);
        book.setBook_id("TSG"+str+sb.toString());//书的id 为TSG+当前的分秒毫米+5位数的随机数
        System.out.println(book.getBook_id());
        book.setBook_icon("cc");
        book.setBook_author("vv");
        book.setBook_name("aa");
        book.setBook_number(16);
        book.setBook_type(type);
        book.setBook_description("cdd");
        int c =bookBean.AddBook(book,admin);
        System.out.println(c);
    }

}
