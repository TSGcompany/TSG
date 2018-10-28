package com.lcvc.tsg.web.Customer.CustomerMyBooks_manage;

import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Admin.BookBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @ClassName CustomerMyBooksControl
 * @Author Anle
 * @Date 2018/10/28 0028 下午 6:36
 * @Version 1.0
 **/
@Controller
public class CustomerMyBooksControl {
    @Resource
    private BookBean bookBean;
    //=================================查看借阅记录===================================
    @RequestMapping(value = "/user/myBorrowingRecord", method = RequestMethod.GET)
    public String myBorrowingRecord(HttpSession session,HttpServletRequest request){
    Customer customer  = (Customer) session.getAttribute("customer");
    System.out.println(bookBean.myBorrowingRecord( customer.getId()).size());
    request.setAttribute("myBorrowingRecord",6);
    request.setAttribute("getBook_TypeAll", bookBean.getBook_TypeAll());
    return "customer/Book/record.jsp";
    }


}
