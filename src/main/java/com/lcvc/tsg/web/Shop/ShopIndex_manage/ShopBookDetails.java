package com.lcvc.tsg.web.Shop.ShopIndex_manage;

import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.servers.Admin.BookBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
    private Integer getBook_id;

    /**
     * @Author Anle
     * @Date 下午 3:36 2018/10/25 0025
     **/
    //====================================跳转到详情页=====================================
    @RequestMapping(value = "/shop/toBookDetailsPage", method = RequestMethod.GET)
    public String toBookDetailsPage(Integer book_id) {
        this.getBook_id = book_id;
        return "shop/GetShow/details_page.jsp";
    }


    //====================================查看某本书详情====================================
    @RequestMapping(value = "/shop/getBookDetails", method = RequestMethod.GET)
    public String getBookDetails(HttpServletRequest request) {
        //判断推荐书中有没有当前这本书
        System.out.println();
        List<Book> list_book = bookBean.Recommend_Book(getBook_id);
        for (int i = 0; i < list_book.size(); i++) {
            //如果主页显示的这本书就将它移除
            if (list_book.get(i).getId() == getBook_id) {
                list_book.remove(i);
                break;
            }
        }
        //如果没有移除那么就删除最后一个
        if(list_book.size()>3){
            list_book.remove(list_book.size()-1);
        }
        request.setAttribute("getBookDetails", bookBean.getBook(getBook_id));
        // ==推荐书（3本 根据该类型以及借阅次数来排序）=====
        request.setAttribute("recommend_Book", list_book);

        return "shop/GetShow/details.jsp";
    }

}
