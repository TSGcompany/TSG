package com.lcvc.tsg.web.Login.filter;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

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
public class LoginForAdminInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean c = false;
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") != null) {//判断session中有没有值 如果 有值表示已经登录
            c = true;
        } else {
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
            response.sendRedirect(basePath + "jsp/shop/login/login.jsp");

        }
        return c;
    }

}
