package com.lcvc.tsg.dao.ShopDao;

import com.lcvc.tsg.model.Book;

import java.util.List;

/**
 * @Author Anle
 * @Date 下午 10:09 2018/10/17 0017
 **/
public interface ShopIndexDao {
    /**
     * @Author Anle
     * @Date 下午 10:09 2018/10/17 0017
     **/
    //=======================================获取书（分页15个）==================================
    List<Book> getShopIndexBook(int index);
}
