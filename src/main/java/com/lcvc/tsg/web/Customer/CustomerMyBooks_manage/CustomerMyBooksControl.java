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
    public String myBorrowingRecord(HttpSession session,HttpServletRequest request,Integer index){
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
    Customer customer  = (Customer) session.getAttribute("customer");
    request.setAttribute("myBorrowingRecord",bookBean.myBorrowingRecord(customer.getId()));


    return "customer/Book/record.jsp";
    }


}
