package com.lcvc.tsg.web.Shop.ShopIndex_manage;

import com.lcvc.tsg.servers.Admin.BookBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName ShopBookDetails
 * @Author Anle
 * @Date 2018/10/25 0025 下午 3:35
 * @Version 1.0
 **/
@Controller
public class ShopBookDetails {
    @Resource
    private BookBean bookBean;
    private  Integer getBook_id;
    /**
     * @Author Anle
     * @Date 下午 3:36 2018/10/25 0025
     **/
    //====================================跳转到详情页=====================================
    @RequestMapping(value = "/shop/toBookDetailsPage", method = RequestMethod.GET)
    public String toBookDetailsPage(Integer book_id){
        this.getBook_id=book_id;
        return "shop/GetShow/details_page.jsp";
    }


    //====================================查看某本书详情====================================
    @RequestMapping(value = "/shop/getBookDetails", method = RequestMethod.GET)
    public String getBookDetails( HttpServletRequest request){
        System.out.println(getBook_id);
        request.setAttribute("getBookDetails",bookBean.getBook(getBook_id));
       // ==推荐书（3本 根据该类型以及借阅次数来排序）=====
        request.setAttribute("recommend_Book",bookBean.Recommend_Book(getBook_id));

        return "shop/GetShow/details.jsp";
    }

}
