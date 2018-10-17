package com.lcvc.tsg.web.Shop.ShopIndex_manage;

import com.lcvc.tsg.dao.AdminDao.BookDao;
import com.lcvc.tsg.model.Book_Type;
import com.lcvc.tsg.servers.Admin.BookBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName ShopIndex_Control
 * @Author Anle
 * @Date 2018/10/17 0017 下午 5:21
 * @Version 1.0
 **/
@Controller
public class ShopIndex_Control {
    @Resource
    private BookBean bookBean;
    //=======================================获取分类==================================
    @RequestMapping(value = "/shop/getBookType", method = RequestMethod.GET)
    public String getBookType(HttpServletRequest request){


        request.setAttribute("getBookType",bookBean.getBook_TypeAll());
        return "shop/mid_hot.jsp";
    }
}
