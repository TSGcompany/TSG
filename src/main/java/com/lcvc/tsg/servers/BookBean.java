package com.lcvc.tsg.servers;

import com.lcvc.tsg.dao.BookDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class BookBean {
@Resource
 private BookDao bookdao;
/**
 * @Author Anle
 * @Date 上午 9:41 2018/9/22 0022
 **/
public int ShowBookNumber(){


    return bookdao.ShowBookNumber();
}
/**
 * @Author Anle
 * @Date 上午 9:41 2018/9/22 0022
 **/
public String bookname(){


    return bookdao.bookname();
}

}
