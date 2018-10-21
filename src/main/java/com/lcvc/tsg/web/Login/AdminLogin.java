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
 * @ClassName AdminLogin
 * @Author Anle
 * @Date 2018/10/8 0008 下午 5:49
 * 管理员登录功能模块
 * @Version 1.0
 **/
@Controller
public class AdminLogin {
    @Resource
    private LoginBean loginBean;

    /**
     * @Author Anle
     * @Date 下午 9:09 2018/10/8 0008
     **/
    // @ResponseBody表示用json格式返回数据 ajax
    @ResponseBody
    @RequestMapping(value = "/admin/login", method = RequestMethod.POST)
    public Map<String, Object> AdminShow(String UserName, String UserPass, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (loginBean.AdminLogin(UserName, UserPass) != null) {//看看返回是否为空
            session.setAttribute("admin",loginBean.AdminLogin(UserName,UserPass));//将Admin存到session中去
            map.put("AdminLogin",1);//返回信息给
        }else{
            map.put("AdminLogin","用户名或者密码错误请重新登录");//返回信息给页面
        }
        return map;
    }
    //=======================================管理员退出登陆======================================
    @RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("admin");
        return "redirect:/index.jsp";
    }
}
