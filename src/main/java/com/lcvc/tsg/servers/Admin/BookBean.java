package com.lcvc.tsg.servers.Admin;

import com.lcvc.tsg.dao.AdminDao.AdminDao;
import com.lcvc.tsg.dao.AdminDao.BookDao;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
    public    List<Book> BookShow(int index){
        index=index*10;//每10个分页
        return bookDao.BookShow(index);
    }
}
