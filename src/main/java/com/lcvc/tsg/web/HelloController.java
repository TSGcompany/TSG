package com.lcvc.tsg.web;

import com.lcvc.tsg.servers.BookBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;


@Controller
public class HelloController {
    @Resource
    private BookBean bookBean;
    /**
     * @Author Anle
     * @Date 下午 11:53 2018/9/21 0021
     **/
    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String hello(){

     
            System.out.println("里面共有"+bookBean.ShowBookNumber()+"本书");

        System.out.println("书名为："+bookBean.bookname());
        System.out.println("书名为："+bookBean.bookname());

        return "/hello.jsp";
    }

    
}