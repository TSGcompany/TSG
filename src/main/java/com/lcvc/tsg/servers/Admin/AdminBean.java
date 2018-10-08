package com.lcvc.tsg.servers.Admin;

import com.lcvc.tsg.dao.AdminDao.AdminDao;
import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Book_Type;
import com.lcvc.tsg.model.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName AdminBean
 * @Author Anle
 * @Date 2018/10/3 0003 下午 4:28
 * @Version 1.0
 **/
@Service
public class AdminBean {
    @Resource
    private AdminDao adminDao;
    /**
     * @Author Anle
     * @Date 下午 5:34 2018/10/7 0007
     **/
    //=============================== 查看管理员详情=============================

   public  Admin getAdmin(int id){

       return adminDao.getAdmin(id);
   }

}
