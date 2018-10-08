package com.lcvc.tsg.dao.AdminDao;

import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;
import com.lcvc.tsg.model.Customer;

import java.util.List;

/**
 * @Author Anle
 * @Date 下午 3:25 2018/10/3 0003
 **/
public interface AdminDao {

    /**
     * @Author Anle
     * @Date 下午 5:34 2018/10/7 0007
     **/
    //=============================== 查看管理员详情=============================

    Admin getAdmin(int id);

}
