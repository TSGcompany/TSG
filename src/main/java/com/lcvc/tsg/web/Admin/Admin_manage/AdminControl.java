package com.lcvc.tsg.web.Admin.Admin_manage;

import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.servers.Admin.AdminBean;
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
 * @ClassName BookControl
 * @Author Anle
 * @Date 2018/10/8 0008 上午 9:47
 * @Version 1.0
 **/
@Controller
public class AdminControl {
    @Resource
    private AdminBean adminBean;
    @Resource
    private LoginBean loginBean;
    //----------------------------------管理员密码修改--------------------------

    /**
     * @Author Anle
     * @Date 上午 9:49 2018/10/8 0008
     **/
    @ResponseBody
    @RequestMapping(value = "/admin/AdminUpdatePassWord", method = RequestMethod.POST)
    public Map<String, Object> updatePassword(String oldpass, String newpass, String confirmpass, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        Admin admin = (Admin) session.getAttribute("admin");
        if (loginBean.AdminLogin(admin.getAdmin_name(), oldpass) != null) {
            if (newpass.equals(confirmpass)) {
                adminBean.updatePassword(admin.getId(), newpass);
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
    @RequestMapping(value = "/admin/updateubase", method = RequestMethod.POST)
    public Map<String, Object> updateubase(Admin admin, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        Admin admin_id = (Admin) session.getAttribute("admin");
        admin.setId(admin_id.getId());


        if (admin.getAdmin_nickname().equals(admin_id.getAdmin_nickname())) {
            if (adminBean.updateubase(admin) > 0) {
                session.setAttribute("admin", adminBean.getAdmin(admin_id.getId()));
                map.put("massage", 1);
            } else {
                map.put("massage", "修改失败！");
            }
        } else {
            if (adminBean.AdminRename(admin.getAdmin_nickname()) > 0) {
                map.put("massage", 2);
            } else {
                if (adminBean.updateubase(admin) > 0) {
                    session.setAttribute("admin", adminBean.getAdmin(admin_id.getId()));
                    map.put("massage", 1);

                } else {
                    map.put("massage", "修改失败！");
                }
            }
        }
        return map;
    }

}