package com.lcvc.tsg.web.Admin.book_manage;

import com.lcvc.tsg.servers.Admin.AdminBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName BookControl
 * @Author Anle
 * @Date 2018/10/8 0008 上午 9:47
 * @Version 1.0
 **/
@Controller
public class BookControl {
    @Resource
    private AdminBean adminBean;
    /**
     * @Author Anle
     * @Date 上午 9:49 2018/10/8 0008
     **/
    @RequestMapping(value = "/admin/BookShow", method = RequestMethod.GET)
    public String CustomerShow(HttpServletRequest request, Integer index) {



        return "";
    }

}
