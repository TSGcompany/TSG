package com.lcvc.tsg.web.Admin.customer_manage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.lcvc.tsg.servers.Admin.CustomerBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @ClassName CustomerShowAll
 * @Author Anle
 * @Date 2018/10/3 0003 下午 4:54
 * @Version 1.0
 **/
@Controller
public class CustomerControl {
    @Resource
    private CustomerBean customerBean;
    /**
     * @Author Anle
     * @Date 上午 11:50 2018/10/5 0005
     * 查看用户  具有分页功能
     **/
   //----------------------------用户管理模块的控制层----------------------
    @RequestMapping(value = "/admin/CustomerShow", method = RequestMethod.GET)
    public String CustomerShow(HttpServletRequest request, Integer index) {
        if (index < 0) {
            index = 0;
        }
        int c = 0;
        if (customerBean.CustomerCount() % 10 == 0) {//计算页码
            c = customerBean.CustomerCount() / 10;
        } else {
            c = (customerBean.CustomerCount() % 10) + 1;
        }
        if(index>c){
            index=c;
        }
        request.setAttribute("indexPage", index);
        request.setAttribute("PageCount", c);
        request.setAttribute("CustomerShow", customerBean.CustomerShow(index));
        return "admin/user/usermanagement.jsp";
    }



}
