package com.lcvc.tsg.web.Customer.CustomerUser_manage;

import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.LoginBean.LoginBean;
import com.lcvc.tsg.servers.Customer.CustomerUserBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CustomerUserControl {
    @Resource
    private CustomerUserBean customerUserBean;
    @Resource
    private LoginBean loginBean;
    //---------------------------------管理员密码修改--------------------------

    /**
     * @Author Anle
     * @Date 上午 9:49 2018/10/8 0008
     **/
    @ResponseBody

    @RequestMapping(value = "/customer/UserUpdatePassWord", method = RequestMethod.POST)
    public Map<String, Object> updatePassword(String oldpass, String newpass, String confirmpass, HttpSession session) {

        Map<String, Object> map = new HashMap<String, Object>();
        Customer customer = (Customer) session.getAttribute("customer");
        if (loginBean.CustomerLogin(customer.getCustomer_name(), oldpass) != null) {
            if (newpass.equals(confirmpass)) {
                customerUserBean.updatePassword(customer.getId(), newpass);
                map.put("massage", 1);//返回信息给
            } else {
                map.put("massage", "两次密码不相同");
            }
        } else {
            map.put("massage", "旧密码错误");//返回信息给页面
        }
        return map;
    }

    //----------------------------------修改基本信息--------------------------
    @ResponseBody
    @RequestMapping(value = "/customer/userupdateubase", method = RequestMethod.POST)
    public Map<String, Object> userupdateubase(Customer customer, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        Customer customer_id = (Customer) session.getAttribute("customer");
        customer.setId(customer_id.getId());


        if (customer.getCustomer_nickname().equals(customer_id.getCustomer_nickname())) {
            if (customerUserBean.userupdateubase(customer) > 0) {
                session.setAttribute("customer", customerUserBean.getCustomer(customer_id.getId()));
                map.put("massage", 1);
            } else {
                map.put("massage", "修改失败！");
            }
        } else {
            if (customerUserBean.UserRename(customer.getCustomer_nickname()) > 0) {
                map.put("massage", "修改失败,该用户名已经被使用！");
            } else {
                if (customerUserBean.userupdateubase(customer) > 0) {
                    session.setAttribute("customer", customerUserBean.getCustomer(customer_id.getId()));
                    map.put("massage", 1);

                } else {
                    map.put("massage", "修改失败！");
                }
            }
        }
        return map;
    }
}
