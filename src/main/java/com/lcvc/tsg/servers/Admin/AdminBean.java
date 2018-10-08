package com.lcvc.tsg.servers.Admin;

import com.lcvc.tsg.dao.AdminDao.AdminDao;
import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;
import com.lcvc.tsg.model.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName AdminBean
 * @Author Anle
 * @Date 2018/10/3 0003 下午 4:28
 * @Version 1.0
 **/
@Service
public class AdminBean {
    @Resource
    private AdminDao adminDao;

    //=============================== 查看客户（分页）==============================
    public List<Customer> CustomerShow(int index) {//展示客户
        index = index * 10;  //按10个
        return adminDao.CustomerShow(index);
    }

    //=============================== 查看客户总数==================================
    public int CustomerCount() {

        return adminDao.CustomerCount();
    }
    // ================================== 查看客户详情==============================
   public Customer getCustomer(int Customer_id){

        return adminDao.getCustomer(Customer_id);
   }

    //******************************************************************书的Bean语句************************************************************************
    /**
     * @Author Anle
     * @Date 下午 4:23 2018/10/6 0006
     **/
    //=============================== 搜索书 =======================================
     public  List<Book> SearchBook(String searchs){

      return adminDao.SearchBook(searchs);
     }
    /**
     * @Author Anle
     * @Date  2018/10/7 0007
     **/
    //=============================== 查看书的总数用于分页 ==============================
   public int BookCount(){
        return adminDao.BookCount();
    }



    //******************************************************************书类型的Bean语句*********************************************************************
    /**
     * @Author Anle
     * @Date 下午 12:59 2018/10/7 0007
     **/
    //=============================== 获取书的类型=============================
    public  Book_Type getBook_Type(int Type_id){

        return adminDao.getBook_Type(Type_id);
    }
    /**
     * @Author Anle
     * @Date 下午 5:52 2018/10/7 0007
     **/
    //=============================== 展示书（分页） ==================================
    public    List<Book> BookShow(int index){
        index=index*10;//每10个分页
        return adminDao.BookShow(index);
    }

    //******************************************************************管理员的Bean语句*********************************************************************
    /**
     * @Author Anle
     * @Date 下午 5:34 2018/10/7 0007
     **/
    //=============================== 查看管理员详情=============================

   public  Admin getAdmin(int id){

       return adminDao.getAdmin(id);
   }

}
