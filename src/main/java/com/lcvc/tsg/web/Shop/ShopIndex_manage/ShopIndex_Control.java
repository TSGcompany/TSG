package com.lcvc.tsg.web.Shop.ShopIndex_manage;

import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.servers.Admin.BookBean;
import com.lcvc.tsg.servers.Shop.ShopIndexBean;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName ShopIndex_Control
 * @Author Anle
 * @Date 2018/10/17 0017 下午 5:21
 * @Version 1.0
 * ============================================用于显示====================================
 **/
@Controller
public class ShopIndex_Control {
    @Resource
    private BookBean bookBean;
    @Resource
    public ShopIndexBean shopIndexBean;
    /**
     * @Author Anle
     * @Date 上午 11:50 2018/10/18 0018
     **/
    //=======================================获取分类==================================
    @RequestMapping(value = "/shop/getBookType", method = RequestMethod.GET)
    public String getBookType(HttpServletRequest request){
        request.setAttribute("getBookType",bookBean.getBook_TypeAll());//设置书的类型
        request.setAttribute("getBookRandomName",shopIndexBean.getBookRandomName());//设置获取随机名
        return "shop/mid_hot.jsp";
    }
    /**
     * @Author Anle
     * @Date 上午 11:50 2018/10/18 0018
     **/
    //=======================================获取书（分页15个）==========================
    @RequestMapping(value = "/shop/getShopIndexBook", method = RequestMethod.GET)
    public String getShopIndexBook(HttpServletRequest request,Integer index){
        //分页
        if (index < 0) {
            index = 0;
        }
        int c = 0;
        if (bookBean.BookCount() % 15 == 0) {//计算页码
            c = bookBean.BookCount() / 15;
        } else {
            c = (bookBean.BookCount() / 15) + 1;
        }
        if (index > c) {
            index = c;
        }
        request.setAttribute("indexPage", index);
        request.setAttribute("PageCount", c);
        request.setAttribute("getShopIndexBook",bookBean.BookShow(index,15));
        return "shop/middle.jsp";
    }
    /**
     * @Author Anle
     * @Date 上午 11:55 2018/10/18 0018
     **/
    //=====================================定时刷新搜索框中的文字===========================
    @ResponseBody
    @RequestMapping(value = "/shop/RefreshInputValue", method = RequestMethod.GET)
    public Map<String, Object> RefreshInputValue(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("RefreshInputValue",shopIndexBean.getBookRandomName());
        //   System.out.println(shopIndexBean.getBookRandomName());
        return map;
    }
    //=====================================搜索书=======================================
    @ResponseBody
    @RequestMapping(value = "/shop/SearchBookWhereBookType", method = RequestMethod.GET)
    public String SearchBookWhereBookType(HttpServletRequest request, Book book){

//        int c = 0;
//        if (bookBean.BookCount() % 15 == 0) {//计算页码
//            c = bookBean.BookCount() / 15;
//        } else {
//            c = (bookBean.BookCount() / 15) + 1;
//        }
//
//        request.setAttribute("indexPage", 1);
//        request.setAttribute("PageCount", c);
//        request.setAttribute("getShopIndexBook",bookBean.BookShow(index,15));





        return "shop/middle.jsp";

    }


}
