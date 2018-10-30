package com.lcvc.tsg.web.Admin.book_manage;

import com.lcvc.tsg.dao.CustomerDao.CustomerRegisterDao;
import com.lcvc.tsg.dao.CustomerDao.CustomerUserDao;
import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Borrowing;
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
    @Resource
    private CustomerRegisterDao crd;//用于查看用户名是否存在
    @Resource
    private CustomerUserDao customerUserDao;//用于还书

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
        request.setAttribute("BookShow", bookBean.BookShow(index, 10));

        return "admin/book/books.jsp";
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
    public Map<String, Object> Return_Book(String book_id, String customer_name) {
        Map<String, Object> map = new HashMap<String, Object>();
        //1.判断输入的用户名是否有错
        if (crd.VerificationUserName(customer_name) > 0) {//如果大于0说明用户名是存在的
            Borrowing borrowing = new Borrowing();
            borrowing.setCustomer_Id(customerUserDao.getCustomer_whereCustomerName(customer_name));//设置用户
            Book b = new Book();
            b.setBook_id(book_id);
            borrowing.setBook_id(b);
            if (bookBean.select_borrowing_count(borrowing) > 0) {//判断有没有没有关于这本书的借阅记录
                //有借阅记录
                if (!bookBean.select_Book_isReturn(borrowing)) {//判断该书是否已经还过
                    //未还
                    bookBean.Return_Book_Borrowing(borrowing);//设置借阅表的东西
                    //设置书本的信息
                    Book book = bookBean.getBook_whereBook_id(book_id);
                    //设置书的数量
                    book.setBook_number(book.getBook_number() + 1);
                    //3.还书
                    bookBean.Return_Book(book);
                    map.put("ReturnBook_message", 1);

                } else {
                    //已还
                    map.put("ReturnBook_message", "该书已经还过！");
                }

            } else {
                //无借阅记录
                map.put("ReturnBook_message", "书名输入错误，或者没有相关的借阅记录！");
            }

        } else {
            //用户不存在
            map.put("ReturnBook_message", "用户名不存在!");
        }

        return map;
    }

    //=========================================修改书籍(跳转到修改页面)============================================
    @RequestMapping(value = "/admin/toUpdateBookPage", method = RequestMethod.GET)
    public String toUpdateBookPage(Integer book_id, HttpServletRequest request) {
        //获取书的分类
        request.setAttribute("getBookType", bookBean.getBook_TypeAll());
        request.setAttribute("getBook", bookBean.getBook(book_id));
        //获取书
        return "admin/book/UpdateBook.jsp";
    }

    //=========================================修改书籍(修改的功能)============================================
    @ResponseBody
    @RequestMapping(value = "/admin/toUpdateBook", method = RequestMethod.POST)
    public Map<String, Object> toUpdateBook(Book book, HttpSession session) {


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
        } else if (bookBean.getBook(book.getId()).getBook_name().equals(book.getBook_name())) {
            map.put("massage", 1);
            Admin admin = (Admin) session.getAttribute("admin");
            bookBean.updateBook(book, admin);
        } else if (bookBean.BookRename(book.getBook_name()) > 0) {//验证有没有重名
            map.put("massage", "添加失败！该书名已经被使用！");
        } else {
            map.put("massage", 1);
            Admin admin = (Admin) session.getAttribute("admin");
            bookBean.updateBook(book, admin);
        }
        return map;
    }


    //=================================删除书籍====================================
    @ResponseBody
    @RequestMapping(value = "/admin/deleteBook", method = RequestMethod.GET)
    public Map<String, Object> deleteBook(Integer book_id) {
        Map<String, Object> map = new HashMap<String, Object>();
        //判断该书是否已经被借阅过
        if(bookBean.select_borrowingAndNotReturn(book_id)>0){
        map.put("massage","该书正在白借阅无法删除!");
        }else {
            if( bookBean.delete_book(book_id)>0){
                map.put("massage",1);
                bookBean.delete_book(book_id);
            }else {
                map.put("massage","删除失败！");
            }

        }

        return map;
    }


}
