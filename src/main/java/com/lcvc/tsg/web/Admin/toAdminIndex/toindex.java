package com.lcvc.tsg.web.Admin.toAdminIndex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @ClassName toindex
 * @Author Anle
 * @Date 2018/10/8 0008 下午 9:34
 * @Version 1.0
 **/
//----------------------------------这个页面只用来跳转到后台页面--------------------------
@Controller
public class toindex {
    @RequestMapping(value = "/admin/ToIndex", method = RequestMethod.GET)
    public String ToIndex() {
    return "admin/index.jsp";
    }
}
