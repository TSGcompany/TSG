package dao;


import com.lcvc.tsg.dao.AdminDao.AdminDao;
import com.lcvc.tsg.dao.AdminDao.BookDao;
import com.lcvc.tsg.dao.AdminDao.CustomerDao;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

import java.util.List;

/**
 * @ClassName AdminDao
 * @Author Anle
 * @Date 2018/10/3 0003 下午 3:45
 * @Version 1.0
 **/
public class AdminDaoTest extends SpringJunitTest {
    @Resource
    private AdminDao adminDao;
    @Resource
    private CustomerDao customerDao;
    @Resource
    private BookDao bookDao;

    /**
     * @Author Anle
     * @Date 下午 12:23 2018/10/7 0007
     **/
    @Test
    public void CustomerShowAllTest() {//展示所有用户，带分页
        List<Customer> list = customerDao.CustomerShow(0);
        for (Customer cu : list) {
            System.out.println(cu.getCustomer_name());
        }
    }

    /**
     * @Author Anle
     * @Date 下午 12:23 2018/10/7 0007
     **/
    @Test
    public void getCustomerTest() { //获取某个用户
        Customer customer = customerDao.getCustomer(6);
        System.out.println(customer.getCustomer_name());
    }

    /**
     * @Author Anle
     * @Date 下午 12:23 2018/10/7 0007
     **/
    @Test
    public void SearchBook() {//搜索相关的书

        System.out.println(bookDao.SearchBook("西").get(1).getBook_author());


    }
    /**
     * @Author Anle
     * @Date 下午 1:37 2018/10/7 0007
     **/
    @Test
    public  void  BookShow_Test(){//展示书
        List<Book> list = bookDao.BookShow(0);
        for (Book book:list) {
            System.out.println(book.getBook_editorsID().getAdmin_name());

        }

    }

    /**
     * @Author Anle
     * @Date 下午 1:01 2018/10/7 0007
     **/
    @Test
    public void getBook_Type_Test() {//获取分类
    System.out.println(bookDao.getBook_Type(2).getBook_type_name());

    }
    /**
     * @Author Anle
     * @Date 下午 5:35 2018/10/7 0007
     **/
    @Test
    public void getAdmin_Test(){//获取用户
    System.out.println(adminDao.getAdmin(1).getAdmin_name());

    }
    /**
     * @Author Anle
     * @Date 下午 6:00 2018/10/7 0007
     **/
    @Test
    public  void BookCount(){
        System.out.println(bookDao.BookCount());
    }
}
