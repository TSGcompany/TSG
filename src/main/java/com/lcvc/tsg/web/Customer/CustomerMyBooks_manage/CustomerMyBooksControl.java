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
    //=================================查看所有借阅记录===================================
    @RequestMapping(value = "/user/myBorrowingRecord", method = RequestMethod.GET)
    public String myBorrowingRecord(HttpSession session,HttpServletRequest request,Integer index){
        Customer customer  = (Customer) session.getAttribute("customer");
        if (index < 0) {
            index = 0;
        }
        int c = 0;
        if (bookBean.myBorrowingRecordCount(customer.getId())% 10 == 0) {//计算页码
            c =bookBean.myBorrowingRecordCount(customer.getId()) / 10;
        } else {
            c = (bookBean.myBorrowingRecordCount(customer.getId())/ 10) + 1;
        }
        if (index > c) {
            index = c;
        }

        request.setAttribute("indexPage", index);
        request.setAttribute("PageCount", c);
        request.setAttribute("myBorrowingRecord",bookBean.myBorrowingRecord(customer.getId(),index));


    return "customer/Book/record.jsp";
    }

    //=================================查看所有已还借阅记录===================================
    @RequestMapping(value = "/user/myBorrowingIsReturnRecord", method = RequestMethod.GET)
    public String myBorrowingIsReturnRecord(HttpSession session,HttpServletRequest request,Integer index){
        Customer customer  = (Customer) session.getAttribute("customer");
        if (index < 0) {
            index = 0;
        }
        int c = 0;
        if (bookBean.myBorrowingIsReturnRecordCount(customer.getId())% 10 == 0) {//计算页码
            c =bookBean.myBorrowingIsReturnRecordCount(customer.getId()) / 10;
        } else {
            c = (bookBean.myBorrowingIsReturnRecordCount(customer.getId())/ 10) + 1;
        }
        if (index > c) {
            index = c;
        }

        request.setAttribute("indexPage", index);
        request.setAttribute("PageCount", c);
        request.setAttribute("myBorrowingIsReturnRecord",bookBean.myBorrowingIsReturnRecord(customer.getId(),index));


        return "customer/Book/recordIsReturn.jsp";
    }




    //=================================查看所有未还借阅记录===================================

    @RequestMapping(value = "/user/myBorrowingNotReturnRecord", method = RequestMethod.GET)
    public String myBorrowingNotReturnRecord(HttpSession session,HttpServletRequest request,Integer index){
        Customer customer  = (Customer) session.getAttribute("customer");
        if (index < 0) {
            index = 0;
        }
        int c = 0;
        if (bookBean.myBorrowingNotReturnRecordCount(customer.getId())% 10 == 0) {//计算页码
            c =bookBean.myBorrowingNotReturnRecordCount(customer.getId()) / 10;
        } else {
            c = (bookBean.myBorrowingNotReturnRecordCount(customer.getId())/ 10) + 1;
        }
        if (index > c) {
            index = c;
        }

        request.setAttribute("indexPage", index);
        request.setAttribute("PageCount", c);
        request.setAttribute("myBorrowingNotReturnRecord",bookBean.myBorrowingNotReturnRecord(customer.getId(),index));


        return "customer/Book/recordNotReturn.jsp";
    }

}
