package com.lcvc.tsg.dao.AdminDao;

import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;
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
    List<Book>SearchBookWhereBookType(Book book);

    /**
     * @Author Anle
     * @Date 下午 1:35 2018/10/7 0007
     **/
    //=============================== 展示书（分页） ==================================
    List<Book> BookShow(@Param(value="index")int index, @Param(value="totals")int totals);
    //(@Param(value="customer_name")String CustomerName, @Param(value="customer_password")
    /**
     * @Author Anle
     * @Date  2018/10/7 0007
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
    int BookRename (String BookName);

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
   //=================================== 还书 =============================================
    int Return_Book (Book book);


}
