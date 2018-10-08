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
    //=============================== 获取书的类型=============================
    Book_Type getBook_Type(int id);

}
