package com.lcvc.tsg.web.Login;

import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.LoginBean.LoginBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName CustomerLogin
 * @Author Anle
 * @Date 2018/10/8 0008 下午 5:49
 * @Version 1.0
 **/
@Controller
public class CustomerLogin {
    @Resource
    private LoginBean loginBean;

    // @ResponseBody表示用json格式返回数据 ajax
    @ResponseBody
    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    public Map<String, Object> UserShow(String UserName, String UserPass, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (loginBean.CustomerLogin(UserName, UserPass) != null) {//看看返回是否为空
            if(loginBean.CustomerLogin(UserName, UserPass).isCustomer_prohibit_Login()){
                map.put("customerLoginMessage",3);//返回信息给
            }else{
                session.setAttribute("customer",loginBean.CustomerLogin(UserName,UserPass));//将Customer存到session中
                map.put("customerLoginMessage",1);//返回信息给
            }
        }else{
            map.put("customerLoginMessage",2);//返回信息给页面
        }
        return map;
    }
    //=======================================用户退出登陆======================================
    @RequestMapping(value = "/user/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("customer");
        return "redirect:/index.jsp";
    }
}
