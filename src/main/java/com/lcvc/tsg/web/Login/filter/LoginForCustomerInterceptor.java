package com.lcvc.tsg.web.Login.filter;

import com.lcvc.tsg.dao.AdminDao.CustomerDao;
import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Admin.CustomerBean;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*
 * ---------------------用户的拦截器-----------------
 * 继承 HandlerInterceptorAdapter
 * 本方法在请求（contronller）执行之前执行
 * @return true表示验证通过，继续执行请求；false表示验证不通过，不执行请求。
 * 
 */
public class LoginForCustomerInterceptor extends HandlerInterceptorAdapter{
	@Resource
	private CustomerBean customerBean;
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		boolean c = false;
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		//每次请求都看一下有没有被禁止登陆
		customer.setCustomer_prohibit_Login(customerBean.getCustomer(customer.getId()).isCustomer_prohibit_Login());
		//每次请求都看有没有被禁止借阅
		customer.setCustomer_prohibit_Borrowing(customerBean.getCustomer(customer.getId()).isCustomer_prohibit_Borrowing());
		if(customer!=null){//判断session中有没有值 如果 有值表示已经登录

			if(customer.isCustomer_prohibit_Login()){
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				//request.setAttribute("prohibit_Login_msg","您已经被禁止登陆！");
				String message ="您已经被禁止登陆！";
				message = java.net.URLEncoder.encode(message.toString(),"utf-8");//设置编码
				response.sendRedirect(basePath+"jsp/shop/login/login.jsp?prohibit_Login_msg="+message);
			}else{
				c=true;
			}

		}else{
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
            response.sendRedirect(basePath+"jsp/shop/login/login.jsp");
		}
		return c;
	}

}
