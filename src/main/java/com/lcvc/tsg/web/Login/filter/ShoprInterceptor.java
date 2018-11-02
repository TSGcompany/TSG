package com.lcvc.tsg.web.Login.filter;

import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Admin.CustomerBean;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * ---------------------管理员的拦截器-----------------
 * 继承 HandlerInterceptorAdapter
 * 本方法在请求（contronller）执行之前执行
 * @return true表示验证通过，继续执行请求；false表示验证不通过，不执行请求。
 * 
 */
public class ShoprInterceptor extends HandlerInterceptorAdapter {
    @Resource
    private CustomerBean customerBean;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer!=null) {
            customer.setCustomer_prohibit_Login(customerBean.getCustomer(customer.getId()).isCustomer_prohibit_Login());
            //每次请求都看有没有被禁止借阅
            customer.setCustomer_prohibit_Borrowing(customerBean.getCustomer(customer.getId()).isCustomer_prohibit_Borrowing());
        }
        return true;
    }

}
