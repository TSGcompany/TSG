package com.lcvc.tsg.web.Shop.ShopIndex_manage;
import com.lcvc.tsg.model.Borrowing;
import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Admin.BookBean;
import com.lcvc.tsg.servers.Shop.ShopBorrowingBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName ShopBorrwing_Control
 * @Author Anle
 * @Date 2018/10/23 0023 下午 3:36
 * @Version 1.0
 * ==========================================借阅和预约的控制层=========================================
 **/
@Controller
public class ShopBorrowing_Control {
    @Resource
    private ShopBorrowingBean borrowingBean;
    @Resource
    private BookBean bookBean;

    /**
     * @Author Anle
     * @Date 下午 3:37 2018/10/23 0023
     **/
    //======================================借阅功能====================================.
    @ResponseBody
    @RequestMapping(value = "/shop/BorrowingBook", method = RequestMethod.GET)
    public Map<String, Object> BorrowingBook(HttpSession session,Integer book_id){
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println(book_id);
        //获取当前用户
        Customer customer = (Customer) session.getAttribute("customer");
        if(!customer.isCustomer_prohibit_Borrowing()){//bit  0是false 1是true  //如果返回是true那么他就被禁止借书.
            //这里表示可以借书
                //创建借阅表
            Borrowing borrowing = new Borrowing();
            borrowing.setCustomer_Id(customer);
            borrowing.setBook_id(bookBean.getBook(book_id));
            borrowing.setBorrowing_Return(false);
                //判断某本书是否被该用户借阅过
            if(borrowingBean.selectBorrowingforCustomer(borrowing)==0){
                    //表示没借阅过
                borrowingBean.addBorrowing(borrowing);//添加借阅
                map.put("BorrowingMessage",1);//表示可以借阅成功

            }else{
                map.put("BorrowingMessage",2);//表示该用户已经被借阅过这本书
            }

        }else{
            //这里表示不可以借书
           map.put("BorrowingMessage",0);//表示该用户被禁止借书
        }
        System.out.println(map.get("BorrowingMessage"));
        return map;
    }
}
