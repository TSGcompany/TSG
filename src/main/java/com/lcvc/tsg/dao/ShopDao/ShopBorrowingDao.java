package com.lcvc.tsg.dao.ShopDao;

import com.lcvc.tsg.model.Borrowing;

public interface ShopBorrowingDao {
    /**
     * @Author Anle
     * @Date 下午 4:13 2018/10/23 0023
     **/
    //=============================查看某个用户是否借阅过某本书========================
    int selectBorrowingforCustomer(Borrowing borrowing);
    /**
     * @Author Anle
     * @Date 下午 5:05 2018/10/23 0023
     **/
    //=================================添加一条借阅信息================================
    int addBorrowing(Borrowing borrowing);
}
