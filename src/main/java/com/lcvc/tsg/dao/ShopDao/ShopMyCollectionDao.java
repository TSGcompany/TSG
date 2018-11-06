package com.lcvc.tsg.dao.ShopDao;

import com.lcvc.tsg.model.MyCollection;

public interface ShopMyCollectionDao {
//=======================添加一条收藏记录===================
    int addCollection(MyCollection myCollection);
//========================判断某个用户收藏表中是否已经包含该书=====================-->
    int collectionCountWhereBookAndUser(MyCollection myCollection);

}
