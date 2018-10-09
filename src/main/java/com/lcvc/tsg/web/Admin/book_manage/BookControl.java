package com.lcvc.tsg.web.Admin.book_manage;

import com.lcvc.tsg.servers.Admin.AdminBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

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
    //-------------------------------展示书（分页）--------------------------------
    @RequestMapping(value = "/admin/BookShow", method = RequestMethod.GET)
        public String CustomerShow(HttpServletRequest request, Integer index) {



        return "admin/user/usermanagement.jsp";
    }
    //-------------------------------添加书籍------------------------------------
    /**
     * @Author Anle
     * @Date 上午 11:43 2018/10/8 0008
     **/
    // @ResponseBody表示用json格式返回数据 ajax
    @ResponseBody
    public Map<String,Object> addBook(){
        Map<String, Object> map = new HashMap<String, Object>();




        return map;
    }
}
