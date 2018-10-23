package com.lcvc.tsg.servers.Shop;

import com.lcvc.tsg.dao.ShopDao.ShopBorrowingDao;
import com.lcvc.tsg.model.Borrowing;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @ClassName ShopBorrowingBean
 * @Author Anle
 * @Date 2018/10/23 0023 下午 4:39
 * @Version 1.0
 **/
@Service
public class ShopBorrowingBean {
    @Resource
    private ShopBorrowingDao shopBorrowingDao;
    /**
     * @Author Anle
     * @Date 下午 4:13 2018/10/23 0023
     **/
    //=============================查看某个用户是否借阅过某本书========================
   public int selectBorrowingforCustomer(Borrowing borrowing){

    return shopBorrowingDao.selectBorrowingforCustomer(borrowing);
    }

    /**
     * @Author Anle
     * @Date 下午 5:05 2018/10/23 0023
     **/
    //=================================添加一条借阅信息================================
    public int addBorrowing(Borrowing borrowing){
        //添加创建时间
        borrowing.setId(null);
        borrowing.setBorrowing_Return(false);//表示没还
        borrowing.setBorrowing_Time(new Timestamp(Calendar.getInstance().getTimeInMillis()));//创建借阅时间
        return shopBorrowingDao.addBorrowing(borrowing);
    }
}
