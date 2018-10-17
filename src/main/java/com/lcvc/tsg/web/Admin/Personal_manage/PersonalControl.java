package com.lcvc.tsg.web.Admin.Personal_manage;

import com.lcvc.tsg.model.Admin;
import com.lcvc.tsg.servers.Admin.AdminBean;
import com.lcvc.tsg.servers.Admin.PersonalBean;
import com.lcvc.tsg.servers.LoginBean.LoginBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
public class PersonalControl {
    @Resource
    private PersonalBean personalBean;
    //----------------------------用户管理模块的控制层----------------------
    @RequestMapping(value = "/admin/AdminShow", method = RequestMethod.GET)
    public String AdminShow(HttpServletRequest request, Integer index) {
        if (index < 0) {
            index = 0;
        }
        int c = 0;
        if (personalBean.AdminCount() % 10 == 0) {//计算页码
            c = personalBean.AdminCount() / 10;
        } else {
            c = (personalBean.AdminCount() % 10) + 1;
        }
        if (index > c) {
            index = c;
        }
        request.setAttribute("indexPage", index);
        request.setAttribute("PageCount", c);
        request.setAttribute("AdminShow", personalBean.AdminShow(index));
        return "admin/Manag/manags.jsp";
    }

    //----------------------------添加管理员----------------------

    @ResponseBody
    @RequestMapping(value = "/admin/AddAdmin", method = RequestMethod.POST)
    public Map<String, Object> AddAdmin(Admin admin, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        Admin admin_id = (Admin) session.getAttribute("admin");
        if (personalBean.Rename(admin.getAdmin_name()) > 0) {//验证有没有重名
            map.put("massage", "添加失败！该名称已经被使用！");
        } else {
            map.put("massage", 1);
            personalBean.AddAdmin(admin);
        }
        return map;
    }

    //----------------------------删除管理员----------------------
    @RequestMapping(value = "/admin/deleteAdmin", method = RequestMethod.GET)
    public String deleteAdmin(Integer id, HttpServletRequest request, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin.getId() == id.intValue()) {
            String message = "";
            message = "删除失败,不能删除自己！";
            request.getSession().setAttribute("mes", message);
        } else {
            personalBean.deleteAdmin(id);
        }
        return "redirect:AdminShow?index=0";
    }

}