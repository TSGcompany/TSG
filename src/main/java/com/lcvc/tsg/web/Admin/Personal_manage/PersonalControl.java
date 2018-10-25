package com.lcvc.tsg.web.Admin.Personal_manage;

import com.lcvc.tsg.dao.AdminDao.AdminDao;
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
    @Resource
    private AdminDao adminDao;
    @Resource
    private AdminBean adminBean;
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
    @ResponseBody
    @RequestMapping(value = "/admin/deleteAdmin", method = RequestMethod.GET)
    public Map<String, Object> deleteAdmin(Integer id, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin.getId() == id.intValue()) {
            map.put("deleteAdmin", 1);
        } else {
            map.put("deleteAdmin", 2);
            personalBean.deleteAdmin(id);
        }
        return map;
    }
    //----------------------------------跳转修改管理员基本信息--------------------------
    @RequestMapping(value = "/admin/goupdateubase", method = RequestMethod.GET)
    public String updateAdmin(Integer id, HttpSession session) {
        session.setAttribute("getAdmin",adminDao.getAdmin(id));
        return "/admin/Manag/Adminupdate.jsp";
    }
    //----------------------------------修改管理基本信息--------------------------
    @ResponseBody
    @RequestMapping(value = "/admin/goupdateubase", method = RequestMethod.POST)
    public Map<String, Object> updateAdmin(Admin admin, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        Admin admin_id = (Admin) session.getAttribute("getAdmin");
        admin.setId(admin_id.getId());
        if (admin.getAdmin_nickname().equals(admin_id.getAdmin_nickname())) {
            if (adminBean.updateAdmin(admin) > 0) {
                session.setAttribute("getAdmin", adminBean.getAdmin(admin_id.getId()));
                map.put("massage", 1);
            } else {
                map.put("massage", "修改失败！");
            }
        } else {
            if (adminBean.AdminRename(admin.getAdmin_nickname()) > 0) {
                map.put("massage", 2);
            } else {
                if (adminBean.updateAdmin(admin) > 0) {
                    session.setAttribute("getAdmin", adminBean.getAdmin(admin_id.getId()));
                    map.put("massage", 1);

                } else {
                    map.put("massage", "修改失败！");
                }
            }
        }
        return map;
    }
}