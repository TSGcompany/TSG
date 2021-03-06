package com.lcvc.tsg.dao.AdminDao;

import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;
import com.lcvc.tsg.model.Borrowing;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {

    /**
     * @Author Anle
     * @Date 下午 4:23 2018/10/6 0006
     **/
    //=============================== 搜索书 ==================================
    List<Book> SearchBook(String searchs);

    /**
     * @Author Anle
     * @Date 下午 5:41 2018/10/25 0025
     **/
    //============================搜索书（通过书名并且还带类型的搜索）===========
    List<Book> SearchBookWhereBookTypeAndName(Book book);
    /**
     * @Author Anle
     * @Date 上午 9:39 2018/10/29 0029
     **/
    //=============================搜索书（通过类型搜索）========================
    List<Book> SearchBookWhereBookType(Integer Type_id);
    /**
     * @Author Anle
     * @Date 下午 5:37 2018/10/26 0026
     **/
    //================================推荐阅读的书 (前三)===========================
    List<Book> Recommend_Book(int bookType_id);

    /**
     * @Author Anle
     * @Date 下午 1:35 2018/10/7 0007
     **/
    //=============================== 展示书（分页） ==================================
    List<Book> BookShow(@Param(value = "index") int index, @Param(value = "totals") int totals);

    /**
     * @Author Anle
     * @Date 2018/10/7 0007
     **/
    //=============================== 查看书的总数用于分页 ==============================
    int BookCount();


    /**
     * @Author Anle
     * @Date 下午 12:59 2018/10/7 0007
     **/
    //=============================== 获取书的类型====================================
    Book_Type getBook_Type(int id);

    /**
     * @Author Anle
     * @Date 下午 7:07 2018/10/9 0009
     **/
    //=============================== 获取所有书的类型==================================
    List<Book_Type> getBook_TypeAll();

    /**
     * @Author Anle
     * @Date 下午 8:10 2018/10/9 0009
     **/
    //=============================== 查看书有没有重名 ==================================
    int BookRename(String BookName);

    /**
     * @Author Anle
     * @Date 上午 9:13 2018/10/10 0010
     **/
    //===============================添加书籍===========================================
    int AddBook(Book book);

    /**
     * @Author Anle
     * @Date 下午 5:04 2018/10/11 0011
     **/
    //===============================获取某本书===========================================
    Book getBook(int id);

    /**
     * @Author Anle
     * @Date 下午 5:41 2018/10/11 0011
     **/
    //===============================通过编号获取某本书======================================
    Book getBook_whereBook_id(String book_id);

    /**
     * @Author Anle
     * @Date 下午 4:28 2018/10/12 0012
     **/
    //=================================== 还书(将原来的书籍数量+1)=============================================
    int Return_Book(Book book);

    //=================================== 借书(将原来的书籍数量-1)=============================================
     int  Borrowing_Book(Book book);
    /**
     * @Author Anle
     * @Date 下午 3:22 2018/10/28 0028
     **/
    //================================= 查看某本书是否已经还过 ================================
    int select_Book_isReturn(Borrowing borrowing);

    /**
     * @Author Anle
     * @Date 下午 4:41 2018/10/28 0028
     **/
    //================================= 查看有没有相关的借阅记录 ================================
    int select_borrowing_count(Borrowing borrowing);

    /**
     * @Author Anle
     * @Date 下午 4:41 2018/10/28 0028
     **/
    //================================= 还书(将借阅记录设置为已还) =============================
    int Return_Book_Borrowing(Borrowing borrowing);

    /**
     * @Author Anle
     * @Date 下午 7:50 2018/10/30 0030
     **/
    //================================= 查看某本书是否正在被借阅并且还未归还 ========================
     int   select_borrowingAndNotReturn(String book_id);

    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户相关的借阅记录(个数) ============================
    int myBorrowingRecordCount(Integer CustomerID);//个数

    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户相关的借阅记录 ============================
    List<Borrowing> myBorrowingRecord(@Param(value="customer_Id")Integer Customer_ID, @Param(value="index")Integer Index);
    /**
     * @Author Anle
     * @Date 下午 9:41 2018/11/2 0002
     **/
    //-================================= 查看某个用户已还相关的借阅记录 ============================
    List<Borrowing> myBorrowingIsReturnRecord(@Param(value="customer_Id")Integer Customer_ID, @Param(value="index")Integer Index);
    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户已还相关的借阅记录(个数) ============================
    int myBorrowingIsReturnRecordCount(Integer CustomerID);//个数

    /**
     * @Author Anle
     * @Date 下午 9:41 2018/11/2 0002
     **/
    //-================================= 查看某个用户未还相关的借阅记录 ============================
    List<Borrowing> myBorrowingNotReturnRecord(@Param(value="customer_Id")Integer Customer_ID, @Param(value="index")Integer Index);


    /**
     * @Author Anle
     * @Date 下午 6:53 2018/10/28 0028
     **/
    //-================================= 查看某个用户已还相关的借阅记录(个数) ============================
    int myBorrowingNotReturnRecordCount(Integer CustomerID);//个数



    //==============================修改书籍============================
   int updateBook(Book book);
   //===============================删除书籍=============================
    int delete_book(int book_id);
}
