package com.lcvc.tsg.servers.Shop;

import com.lcvc.tsg.dao.ShopDao.ShopMyCollectionDao;
import com.lcvc.tsg.model.MyCollection;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @ClassName ShopMyCollectionBean
 * @Author Anle
 * @Date 2018/11/6 0006 下午 8:43
 * @Version 1.0
 **/
@Service
public class ShopMyCollectionBean {
    @Resource
    private ShopMyCollectionDao smcd;
    //=======================添加一条收藏记录===================
   public int addCollection(MyCollection myCollection){
       return smcd.addCollection(myCollection);
   }
    //========================判断某个用户收藏表中是否已经包含该书=====================-->
    public int collectionCountWhereBookAndUser(MyCollection myCollection){
       return smcd.collectionCountWhereBookAndUser(myCollection);
    }

}
