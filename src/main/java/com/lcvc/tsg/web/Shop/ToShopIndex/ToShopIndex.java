package com.lcvc.tsg.web.Shop.ToShopIndex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @ClassName ToShopIndex
 * @Author Anle
 * @Date 2018/10/17 0017 上午 11:07
 * @Version 1.0
 * ==================================给页面只是单纯用来跳转到前台页面============================
 **/
@Controller
public class ToShopIndex {
    @RequestMapping(value = "/shop/ToShopIndex")
    public String ToShopIndex(){
        return "shop/index.jsp";
    }
}
