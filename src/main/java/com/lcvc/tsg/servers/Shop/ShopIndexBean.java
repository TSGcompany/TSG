package com.lcvc.tsg.servers.Shop;

import com.lcvc.tsg.dao.ShopDao.ShopIndexDao;
import com.lcvc.tsg.model.Book;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @ClassName ShopIndexBean
 * @Author Anle
 * @Date 2018/10/17 0017 下午 10:31
 * @Version 1.0
 **/
@Service
public class ShopIndexBean {
    @Resource
    private ShopIndexDao shopIndexDao;
    /**
     * @Author Anle
     * @Date 下午 10:09 2018/10/17 0017
     **/
    //=======================================获取书（分页15个）==================================
  public List<Book> getShopIndexBook(int index){
        return shopIndexDao.getShopIndexBook(index);
    }
    /**
     * @Author Anle
     * @Date 上午 11:18 2018/10/18 0018
     **/
    //==============================随机获取书名用于搜索框中提示==================================
   public String getBookRandomName(){
       List<Integer> list = new ArrayList<Integer>();
       for (int i = 0; i < shopIndexDao.getBookNameAll().size(); i++) {
           list.add(i);
       }
       Collections.shuffle(shopIndexDao.getBookNameAll());
       return shopIndexDao.getBookNameAll().get(0);

   }
}
