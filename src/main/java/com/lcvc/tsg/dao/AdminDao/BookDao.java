package com.lcvc.tsg.dao.AdminDao;

import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;

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
     * @Date 下午 1:35 2018/10/7 0007
     **/
    //=============================== 展示书（分页） ==================================
    List<Book> BookShow(int index);
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
}
