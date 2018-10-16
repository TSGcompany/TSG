package com.lcvc.tsg.web.Customer.ToCustomerIndex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @ClassName ToCustomerIndex
 * @Author Anle
 * @Date 2018/10/15 0015 下午 11:15
 * @Version 1.0
 **/
//----------------------------------这个页面只用来跳转到用户页面--------------------------
@Controller
public class ToCustomerIndex {
    @RequestMapping(value = "/user/ToIndex", method = RequestMethod.GET)
    public String ToIndex() {
        return "customer/index.jsp";
    }
}
