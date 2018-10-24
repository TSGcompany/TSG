package com.lcvc.tsg.web.Admin.book_manage;

import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.servers.Admin.BookBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName BookControl
 * @Author Anle
 * @Date 2018/10/8 0008 上午 9:47
 * @Version 1.0
 **/
@Controller
public class BookControl {
    @Resource
    private BookBean bookBean;

    /**
     * @Author Anle
     * @Date 上午 9:49 2018/10/8 0008
     **/
    //-------------------------------展示书（分页）--------------------------------
    @RequestMapping(value = "/admin/BookShow", method = RequestMethod.GET)
    public String CustomerShow(HttpServletRequest request, Integer index) {
        if (index < 0) {
            index = 0;
        }
        int c = 0;
        if (bookBean.BookCount() % 10 == 0) {//计算页码
            c = bookBean.BookCount() / 10;
        } else {
            c = (bookBean.BookCount() / 10) + 1;
        }
        if (index > c) {
            index = c;
        }
        request.setAttribute("indexPage", index);
        request.setAttribute("PageCount", c);
        request.setAttribute("BookShow", bookBean.BookShow(index,10));

        return "admin/book/books.jsp";
    }
    //-------------------------------添加书籍------------------------------------

    /**
     * @Author Anle
     * @Date 上午 11:43 2018/10/8 0008
     **/
    // @ResponseBody表示用json格式返回数据 ajax
    @ResponseBody
    public Map<String, Object> addBook() {
        Map<String, Object> map = new HashMap<String, Object>();
        return map;
    }

    //=============================== 获取所有书的类型==================================

    /**
     * @Author Anle
     * @Date 下午 7:15 2018/10/9 0009
     **/

    @RequestMapping(value = "/admin/getBook_TypeAll", method = RequestMethod.GET)
    public String getBook_TypeAll(HttpServletRequest request) {
        request.setAttribute("getBook_TypeAll", bookBean.getBook_TypeAll());
        return "admin/book/Addbooks.jsp";
    }

    //=============================== 添加书籍==================================
    // @ResponseBody表示用json格式返回数据 ajax
    @ResponseBody
    @RequestMapping(value = "/admin/AddBook", method = RequestMethod.POST)
    public Map<String, Object> Add_Book(Book book, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (book.getBook_type().getId() < 0) {
            map.put("massage", "添加失败！类型不能为空！");
        } else if (book.getBook_name().length() == 0 || book.getBook_name() == null) {
            map.put("massage", "添加失败！书名不能为空！");
        } else if (book.getBook_author().length() == 0 || book.getBook_author() == null) {
            map.put("massage", "添加失败！作者不能为空！");
        } else if (book.getBook_icon().length() == 0 || book.getBook_icon() == null) {
            map.put("massage", "添加失败！图片不能为空！");
        } else if (book.getBook_number() == 0 || book.getBook_number() == null) {
            map.put("massage", "添加失败！书的数量不能为空！");
        } else if (bookBean.BookRename(book.getBook_name()) > 0) {//验证有没有重名
            map.put("massage", "添加失败！该书名已经被使用！");
        } else {
            map.put("massage", 1);
            Admin admin = (Admin) session.getAttribute("admin");
            bookBean.AddBook(book, admin);
        }

        return map;
    }

    //=============================== 还书籍==================================
    // @ResponseBody表示用json格式返回数据 ajax
    @ResponseBody
    @RequestMapping(value = "/admin/Return_Book", method = RequestMethod.POST)
    public Map<String, Object> Return_Book(String book_id) {
        Map<String, Object> map = new HashMap<String, Object>();
        //1.查看要还的书是否存在
        if (bookBean.getBook_whereBook_id(book_id) != null) {//如果返回的不是null表示该书存在于数据库中
            //2.存在数据库中的话就获取他现有的书本数量
            Book book = bookBean.getBook_whereBook_id(book_id);
            //设置书的数量
            book.setBook_number(book.getBook_number() + 1);
            //3.还书
            bookBean.Return_Book(book);
            map.put("ReturnBook_message", 1);
        } else {

            map.put("ReturnBook_message", "书编号输入错误！");
        }

        return map;
    }

}
