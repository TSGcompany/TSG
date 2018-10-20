package com.lcvc.tsg.web.Login;

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
    @RequestMapping(value = "/user/CustomerLogin", method = RequestMethod.POST)
    public Map<String, Object> CustomerShow(String UserName, String UserPass, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (loginBean.CustomerLogin(UserName, UserPass) != null) {//看看返回是否为空
            session.setAttribute("Customer",loginBean.CustomerLogin(UserName,UserPass));//将Customer存到session中去
            map.put("CustomerLogin",1);//返回信息给
        }else{
            map.put("CustomerLogin","用户名或者密码错误请重新登录");//返回信息给页面
        }
        return map;
    }
    //=======================================用户退出登陆======================================
    @RequestMapping(value = "/user/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("Customer");
        return "redirect:/index.jsp";
    }
}
