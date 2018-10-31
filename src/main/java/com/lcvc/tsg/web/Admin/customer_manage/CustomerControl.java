package com.lcvc.tsg.web.Admin.customer_manage;

import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Admin.CustomerBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName CustomerShowAll
 * @Author Anle
 * @Date 2018/10/3 0003 下午 4:54
 * @Version 1.0
 **/
@Controller
public class CustomerControl {
    @Resource
    private CustomerBean customerBean;
    /**
     * @Author Anle
     * @Date 上午 11:50 2018/10/5 0005
     * 查看用户  具有分页功能
     **/
   //----------------------------用户管理模块的控制层----------------------
    @RequestMapping(value = "/admin/CustomerShow", method = RequestMethod.GET)
    public String CustomerShow(HttpServletRequest request, Integer index) {
        if (index < 0) {
            index = 0;
        }
        int c = 0;
        if (customerBean.CustomerCount() % 15 == 0) {//计算页码
            c = customerBean.CustomerCount() / 15;
        } else {
            c = (customerBean.CustomerCount() / 15) + 1;
        }

        if(index>c){
            index=c;
        }
        request.setAttribute("indexPage", index);
        request.setAttribute("PageCount", c);
        request.setAttribute("CustomerShow", customerBean.CustomerShow(index));
        return "admin/customer/usermanagement.jsp";
    }

    //----------------------------解除或者禁止用户登录的控制层----------------------
    @ResponseBody
    @RequestMapping(value = "/admin/RelieveOrProhibitCustomerLogin", method = RequestMethod.GET)
    public Map<String,Object> RelieveOrProhibitCustomerLogin(HttpServletRequest request, Integer customerid,boolean loginvalue) {
    Map<String,Object> map = new HashMap<>();
    Customer customer = customerBean.getCustomer(customerid);
    customer.setCustomer_prohibit_Login(loginvalue);
    if(customer.isCustomer_prohibit_Login()){//判断传来的要禁止登录还是解除禁止登录
    //表示禁止登录
        customerBean.prohibit_Customer_Login(customer);
    map.put("LoginValue","禁止登录成功！");
    }else{
        customerBean.prohibit_Customer_Login(customer);
        map.put("LoginValue","解除禁止登录成功！");
    }
        return map;
    }
    //----------------------------解除或者禁止用户借阅的控制层----------------------
    @ResponseBody
    @RequestMapping(value = "/admin/RelieveOrProhibitCustomerBorrowing", method = RequestMethod.GET)
    public Map<String,Object> RelieveOrProhibitCustomerBorrowing(HttpServletRequest request, Integer customerid,boolean borrowingvalue) {
        Map<String,Object> map = new HashMap<>();
        Customer customer = customerBean.getCustomer(customerid);
       customer.setCustomer_prohibit_Borrowing(borrowingvalue);
        if(customer.isCustomer_prohibit_Borrowing()){//判断传来的要禁止登录还是解除禁止登录
            //表示禁止登录
            customerBean.prohibit_Customer_Borrowing(customer);
            map.put("BorrowingValue","禁止借阅成功！");
        }else{
            customerBean.prohibit_Customer_Borrowing(customer);
            map.put("BorrowingValue","解除禁止借阅成功！");
        }
        return map;
    }
}
