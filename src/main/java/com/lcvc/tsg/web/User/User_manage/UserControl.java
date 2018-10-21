package com.lcvc.tsg.web.User.User_manage;

import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.LoginBean.LoginBean;
import com.lcvc.tsg.servers.User.UserBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName BookControl
 * @Author Anle
 * @Date 2018/10/8 0008 上午 9:47
 * @Version 1.0
 **/
@Controller
public class UserControl {
    @Resource
    private UserBean userBean;
    @Resource
    private LoginBean loginBean;
    //----------------------------------用户密码修改--------------------------

    /**
     * @Author Anle
     * @Date 上午 9:49 2018/10/8 0008
     **/
    @ResponseBody
    @RequestMapping(value = "/admin/UserUpdatePassWord", method = RequestMethod.POST)
    public Map<String, Object> updateUserPassWord(String oldpass, String newpass, String confirm, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        Customer customer = (Customer) session.getAttribute("customer");
        if (loginBean.CustomerLogin(customer.getCustomer_name(), oldpass) != null) {
            if (newpass.equals(confirm)) {
                userBean.updateUserPassWord(customer.getId(), newpass);
                map.put("massage", 1);//返回信息给
            } else {
                map.put("massage", "两次密码不相同");
            }
        } else {
            map.put("massage", "旧密码错误");//返回信息给页面
        }
        return map;
    }

}