package com.lcvc.tsg.web.Customer.CustomerRegister_manage;

import com.lcvc.tsg.OtherPackage.CustomerRegForm;
import com.lcvc.tsg.OtherPackage.MyEmail;
import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.servers.Customer.CustomerRegisterBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * @ClassName CustomerRegisterControl
 * @Author Anle
 * @Date 2018/10/16 0016 上午 11:35
 * @Version 1.0
 *  *  * ---------------------------------------这个Control只是单纯用来注册用户-----------------------------
 **/
@Controller
public class CustomerRegisterControl {
    private  String VerificationCode;
    @Resource
    private CustomerRegisterBean customerRegisterBean;
    /**
     * @Author Anle
     * @Date 上午 11:37 2018/10/16 0016
     **/
    //======================================看用户名有没有被使用过==================================
    @ResponseBody
    @RequestMapping(value = "/register/VerificationUserName", method = RequestMethod.GET)
    public Map<String, Object> VerificationUserName(String customerName) {
        Map<String, Object> map = new HashMap<>();
        //判断里面有没有重名的
        if(customerRegisterBean.VerificationUserName(customerName)>0){
            map.put("registerMessage",1);
        }else{
            map.put("registerMessage",2);
        }
        return  map;
    }
    //=========================================发送验证码==========================================
   /**
     * @Author Anle
     * @Date 下午 3:32 2018/10/16 0016
     **/
    @ResponseBody
    @RequestMapping(value = "/register/SendVerificationCode", method = RequestMethod.GET)
    public Map<String, Object> SendVerificationCode(String customerEmain) {
        Map<String, Object> map = new HashMap<>();
        if(customerEmain!=null) {
            try {
            MyEmail myEmail = new MyEmail();
            //.1生成生成验证码
            int length = 5;//5位随机数
            String base = "0123456789";
            Random random = new Random();
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < length; i++) {
                int number = random.nextInt(base.length());
                sb.append(base.charAt(number));
            }
//                myEmail.chooseOperation(customerEmain, sb.toString());
//                map.put("CodeMessage",1);
//                map.put("VerificationCode",sb.toString());//如果发送成功就将验证码发送到前台
//                VerificationCode = sb.toString();//保存验证码 用于前端验证
//                System.out.println(sb.toString());
            //2.发送验证码
            if (myEmail.chooseOperation(customerEmain, sb.toString())==1){//如果发送成功时
                map.put("CodeMessage",1);
                map.put("VerificationCode",sb.toString());//如果发送成功就将验证码发送到前台
                VerificationCode = sb.toString();//保存验证码 用于前端验证
               //==================================================
                System.out.println(sb.toString());
            }else{
                map.put("CodeMessage",4);
            }

            }catch (Exception e){
                //发送失败时
                map.put("CodeMessage",3);
            }
        }else {
            //邮箱为空
            map.put("CodeMessage",2);
        }
        return  map;
    }
    /**
     * @Author Anle
     * @Date 下午 5:04 2018/10/16 0016
     **/
  //=========================================用户注册==========================================
    @ResponseBody
    @RequestMapping(value = "/register/AddCustomer", method = RequestMethod.POST)
    public Map<String, Object> AddCustomer(CustomerRegForm customerRegForm) {
        Map<String, Object> map = new HashMap<>();
//    System.out.println(customerRegForm.getPassword());System.out.println(customerRegForm.getInputVerificationCode());
//     System.out.println(customerRegForm.getRepassword());
//        System.out.println(customerRegForm.getUserEmail());

        if(customerRegisterBean.VerificationUserName(customerRegForm.getCustomerName())==0) {//判断用户名是被使用过
            if (VerificationCode.equals(customerRegForm.getInputVerificationCode())) {//判断验证码是否正确
                if (customerRegForm.getPassword().equals(customerRegForm.getRepassword())) {//判断两个密码是否全等
                    Customer customer = new Customer();
                    customer.setCustomer_name(customerRegForm.getCustomerName());
                    customer.setCustomer_password(customerRegForm.getPassword());
                    customer.setCustomer_Email(customerRegForm.getUserEmail());
                    customerRegisterBean.Customer_register(customer);
                    map.put("RegAdd_User", 1);
                } else {
                    map.put("RegAdd_User", 3);
                }
            } else {
                map.put("RegAdd_User", 2);
            }
        }else{
            map.put("RegAdd_User", 4);
        }
        System.out.println(map.get("RegAdd_User"));
        VerificationCode=null;//验证之后将值刷新
       return  map;
    }

}
