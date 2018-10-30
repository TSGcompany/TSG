package dao;


import com.lcvc.tsg.dao.AdminDao.AdminDao;
import com.lcvc.tsg.dao.AdminDao.BookDao;
import com.lcvc.tsg.dao.AdminDao.CustomerDao;
import com.lcvc.tsg.model.*;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
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
    public void BookShow_Test() {//展示书
        List<Book> list = bookDao.BookShow(0, 10);
        for (Book book : list) {
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
    public void getAdmin_Test() {//获取用户
        System.out.println(adminDao.getAdmin(1).getAdmin_phone());

    }

    /**
     * @Author Anle
     * @Date 下午 6:00 2018/10/7 0007
     **/
    @Test
    public void BookCount() {//获取书的数量
        System.out.println(bookDao.BookCount());

        int c = 0;
        if (bookDao.BookCount() % 10 == 0) {//计算页码
            c = bookDao.BookCount() / 10;
        } else {
            c = (bookDao.BookCount() / 10) + 1;
        }
        System.out.println(c);
//        SimpleDateFormat sdf=new SimpleDateFormat("mmssSSS");
//
//        String str=sdf.format(new Date());
//        System.out.println("当前时间是："+str);
//        System.out.println("当前时间是："+str.length());
    }

    /**
     * @Author Anle
     * @Date 下午 7:09 2018/10/9 0009
     **/
    @Test
    public void getBook_TypeAll_Test() {//获取所有书类型
        for (Book_Type type : bookDao.getBook_TypeAll()) {
            System.out.println(type.getBook_type_name());
        }

    }

    /**
     * @Author Anle
     * @Date 下午 8:10 2018/10/9 0009
     **/
    //=============================== 查看书有没有重名 ==================================
    @Test
    public void BookRename_Test() {
        System.out.println(bookDao.BookRename("西游记"));
    }

    /**
     * @Author Anle
     * @Date 下午 5:07 2018/10/11 0011
     **/
    //===============================通过id获取某本书===========================================
    @Test
    public void getBook() {
        System.out.println(bookDao.getBook(3).getBook_number());

    }

    /**
     * @Author Anle
     * @Date 下午 5:07 2018/10/11 0011
     **/
    //===============================通过书名获取某本书===========================================
    @Test
    public void getBook_whereName() {
        System.out.println(bookDao.getBook_whereBook_id("TSG292927057019").getBook_number());

    }

    /**
     * @Author Anle
     * @Date 下午 4:29 2018/10/12 0012
     **/
    //=================================== 还书 =============================================
    @Test
    public void Return_Book_Test() {

        Book book = new Book();
        book.setId(21);
        book.setBook_number(107);
        System.out.println(bookDao.Return_Book(book));

    }

    @Test
    public void CCD() {
        List<Book> bookList = bookDao.BookShow(0, 10);
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 0; i < 5; i++) {
            list.add(i);
        }
        Collections.shuffle(list);
        System.out.println(list.get(0));
    }

    //==========================搜索书（通过书名并且还带类型的搜索）===================================
    @Test
    public void SearchBookWhereBookTypeAndName_Test() {
        Book_Type book_type = new Book_Type();
        Book book = new Book();
        book_type.setId(1);
        book.setBook_name("三");
        book.setBook_type(book_type);
        List<Book> list = bookDao.SearchBookWhereBookTypeAndName(book);
        for (Book b : list) {
            System.out.println(b.getBook_name());
            System.out.println(b.getBook_creatorID().getAdmin_name());
        }

    }


    /**
     * @Author Anle
     * @Date 下午 5:37 2018/10/26 0026
     **/
    //================================推荐阅读的书 (前三)===========================
    @Test
    public void Recommend_Book_Test() {
        List<Book> listbook = bookDao.Recommend_Book(1);
        for (Book b : listbook) {
            System.out.println(b.getBook_name());
        }

    }


    /*
     * @Author Anle
     * @Date 下午 3:22 2018/10/28 0028
     **/
    //================================= 查看某本书是否已经还过 ================================
    @Test
    public void select_Book_isReturn_Test() {
        Borrowing borrowing = new Borrowing();
        Customer customer = new Customer();
        customer.setId(21);
        Book b = new Book();
        b.setBook_id("TSG182191931606");
        borrowing.setCustomer_Id(customer);
        borrowing.setBook_id(b);

      System.out.println(bookDao.select_Book_isReturn(borrowing));
     //   System.out.println(bookDao.select_borrowing_count(borrowing));
//        borrowing.setBorrowing_Return_Time(new Timestamp(Calendar.getInstance().getTimeInMillis()));
//        borrowing.setBorrowing_Return(true);
//        System.out.println(bookDao.Return_Book_Borrowing(borrowing));
    }

    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户相关的借阅记录 ============================
    @Test
    public void myBorrowingRecord_Test(){
//        for (Borrowing br: bookDao.myBorrowingRecord(21)) {
//            System.out.println(br.getBook_id().getBook_icon());
//        }
    System.out.println(bookDao.myBorrowingRecord(21).get(1).getId());
    }
    /**
     * @Author Anle
     * @Date 上午 9:39 2018/10/29 0029
     **/
    //=============================搜索书（通过类型搜索）========================
    @Test
    public void SearchBookWhereBookType_Test(){
        for (Book b:bookDao.SearchBookWhereBookType(1) ) {
            System.out.println(b.getBook_name());
        }
    }
    //==============================修改书籍============================
    @Test
    public void updateBook_Test(){
        Admin admin  = new Admin();
        admin.setId(1);
        Book_Type book_type = new Book_Type();
        book_type.setId(1);
        Book book = new Book();


        book.setId(21);
        book.setBook_name("忆江南撑大");
        book.setBook_type(book_type);
        book.setBook_editorsID(admin);
        book.setBook_number(151);
        book.setBook_icon("/TSG/upload/image/20181030/20181030184029_678.jpg");
        book.setBook_author("曹　植");
        System.out.println( bookDao.updateBook(book));
    }
    /**
     * @Author Anle
     * @Date 下午 7:50 2018/10/30 0030
     **/
    //================================= 查看某本书是否正在被借阅并且还未归还 ========================
    @Test
      public   void   select_borrowingAndNotReturn(){
        System.out.println(bookDao.select_borrowingAndNotReturn("TSG182191931606"));
    }
    @Test
    public  void delete_book(){
          bookDao.delete_book(35);
    }

}
