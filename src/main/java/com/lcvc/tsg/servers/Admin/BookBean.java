package com.lcvc.tsg.servers.Admin;

import com.lcvc.tsg.dao.AdminDao.BookDao;
import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;
import com.lcvc.tsg.model.Borrowing;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @ClassName BookBean
 * @Author Anle
 * @Date 2018/10/8 0008 上午 10:03
 * @Version 1.0
 **/
@Service
public class BookBean {
    @Resource
    private BookDao bookDao;
    /**
     * @Author Anle
     * @Date 下午 4:23 2018/10/6 0006
     **/
    //=============================== 搜索书 =======================================
    public List<Book> SearchBook(String searchs){

        return bookDao.SearchBook(searchs);
    }

    /**
     * @Author Anle
     * @Date 下午 5:41 2018/10/25 0025
     **/
    //============================搜索书（通过书名并且还带类型的搜索）===============
   public List<Book>SearchBookWhereBookTypeAndName(Book book){
        return bookDao.SearchBookWhereBookTypeAndName(book);
    }

    /**
     * @Author Anle
     * @Date 上午 9:39 2018/10/29 0029
     **/
    //=============================搜索书（通过类型搜索）========================
    public  List<Book> SearchBookWhereBookType(Integer Type_id){

        return bookDao.SearchBookWhereBookType(Type_id);
    }
    /**
     * @Author Anle
     * @Date 下午 5:37 2018/10/26 0026
     **/
    //================================推荐阅读的书 (前三)===========================
    public  List<Book>Recommend_Book(int book_id){
            //根据这本书的id获取他的类型
        return bookDao.Recommend_Book( getBook(book_id).getBook_type().getId());
    }
    /**
     * @Author Anle
     * @Date  2018/10/7 0007
     **/
    //=============================== 查看书的总数用于分页 ==============================
    public int BookCount(){
        return bookDao.BookCount();
    }

    /**
     * @Author Anle
     * @Date 下午 12:59 2018/10/7 0007
     **/
    //=============================== 获取书的类型=============================
    public Book_Type getBook_Type(int Type_id){

        return bookDao.getBook_Type(Type_id);
    }
    /**
     * @Author Anle
     * @Date 下午 5:52 2018/10/7 0007
     **/
    //=============================== 展示书（分页） ==================================
    public    List<Book> BookShow(int index,int totals){
        index=index*10;//每10个分页
        return bookDao.BookShow(index,totals);
    }
    /**
     * @Author Anle
     * @Date 下午 7:07 2018/10/9 0009
     **/
    //=============================== 获取所有书的类型==================================
    public List<Book_Type> getBook_TypeAll(){
       return bookDao.getBook_TypeAll();
    }

    /**
     * @Author Anle
     * @Date 下午 7:54 2018/10/9 0009
     **/
    //=============================== 查看书有没有重名 ==================================
    public  int BookRename (String BookName){

        return bookDao.BookRename(BookName);
    }
    /**
     * @Author Anle
     * @Date 上午 9:15 2018/10/10 0010
     **/
    //===============================添加书籍===========================================
    public  int AddBook(Book book, Admin admin){
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
        book.setId(null );//id自动增长
        book.setBook_id("TSG"+str+sb.toString());//书的id 为TSG+当前的分秒毫米+5位数的随机数
        book.setBook_creatorID(admin);
        book.setBook_editorsID(admin);
        book.setBook_release_Date(new Timestamp(Calendar.getInstance().getTimeInMillis()));//将系统当前时间作为创建时间
        return  bookDao.AddBook(book);
    }
    /**
     * @Author Anle
     * @Date 下午 5:04 2018/10/11 0011
     **/
    //===============================获取某本书===========================================
    public Book getBook(int id){
        return bookDao.getBook(id);
    }

    /**
     * @Author Anle
     * @Date 下午 5:41 2018/10/11 0011
     **/
    //===============================获取某本书===========================================
   public Book getBook_whereBook_id(String book_id){

       return bookDao.getBook_whereBook_id(book_id);
   }

    /**
     * @Author Anle
     * @Date 下午 4:28 2018/10/12 0012
     **/
    //=================================== 还书(将原来的书籍数量+1) =============================================
   public int Return_Book (Book book){
       return bookDao.Return_Book(book);
   }
   /**
    * @Author Anle
    * @Date 下午 8:48 2018/10/30 0030
    **/
   //=================================== 还书(将原来的书籍数量+1) =============================================
   public int Borrowing_Book (Book book){
       return bookDao.Borrowing_Book(book);
   }

    /**
     * @Author Anle
     * @Date 下午 3:22 2018/10/28 0028
     **/
    //================================= 查看某本书是否已经还过 ================================
    public   int  select_Book_isReturn(Borrowing borrowing){

        return bookDao.select_Book_isReturn(borrowing);
    }
    /**
     * @Author Anle
     * @Date 下午 4:41 2018/10/28 0028
     **/
    //================================= 查看有没有相关的借阅记录 ================================
    public  int select_borrowing_count(Borrowing borrowing){

        return bookDao.select_borrowing_count(borrowing);
    }
    /**
     * @Author Anle
     * @Date 下午 4:41 2018/10/28 0028
     **/
    //================================= 还书(将借阅记录设置为已还) =============================
   public int  Return_Book_Borrowing(Borrowing borrowing){
       borrowing.setBorrowing_Return(true);//已还
       borrowing.setBorrowing_Return_Time(new Timestamp(Calendar.getInstance().getTimeInMillis()));//设置还书时间
       return bookDao.Return_Book_Borrowing(borrowing);
   }
    /**
     * @Author Anle
     * @Date 下午 7:50 2018/10/30 0030
     **/
    //================================= 查看某本书是否正在被借阅并且还未归还 ========================
    public int   select_borrowingAndNotReturn(int bookid){
        return bookDao.select_borrowingAndNotReturn(bookDao.getBook(bookid).getBook_id());
    }

    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户相关的借阅记录 ============================
    public  List<Borrowing> myBorrowingRecord(Integer CustomerID,Integer index){
        index=index*10;
        return bookDao.myBorrowingRecord(CustomerID,index);
    }
    /**
     * @Author Anle
     * @Date 下午 9:41 2018/11/2 0002
     **/
    //-================================= 查看某个用户已还相关的借阅记录 ============================
    public List<Borrowing> myBorrowingIsReturnRecord(Integer Customer_ID, Integer Index){
        Index=Index*10;
        return bookDao.myBorrowingIsReturnRecord(Customer_ID,Index);
    }
    /**
     * @Author Anle
     * @Date 下午 9:41 2018/11/2 0002
     **/
    //-================================= 查看某个用户已还相关的借阅记录 ============================
    public List<Borrowing> myBorrowingNotReturnRecord(Integer Customer_ID, Integer Index){
        Index=Index*10;
        return bookDao.myBorrowingNotReturnRecord(Customer_ID,Index);
    }
    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户未还相关的借阅记录(个数) ============================
   public int myBorrowingNotReturnRecordCount(Integer CustomerID){
       return bookDao.myBorrowingNotReturnRecordCount(CustomerID);
   }
    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户已还相关的借阅记录(个数) ============================
    public int myBorrowingIsReturnRecordCount(Integer CustomerID){
        return bookDao.myBorrowingIsReturnRecordCount(CustomerID);
    }



    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户相关的借阅记录（总数） ============================
    public  int myBorrowingRecordCount(Integer CustomerID){

        return bookDao.myBorrowingRecordCount(CustomerID);
    }

    //==============================修改书籍============================
   public int updateBook(Book book,Admin admin){

       book.setBook_editorsID(admin);//设置编辑者

       return bookDao.updateBook(book);
   }


    //===============================删除书籍=============================
    public int delete_book(int book_id){
     return  bookDao.delete_book(book_id);
    }
}
