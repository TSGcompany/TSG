package com.lcvc.tsg.OtherPackage;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @ClassName MyCad
 * @Author Anle
 * @Date 2018/10/31 0031 下午 11:01
 * @Version 1.0
 **/
public class MyCad {

    public String achieveCode() {
        String[] beforeShuffle= new String[] { "2", "3", "4", "5", "6", "7", "8", "9","1","0" };
        List list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        String result = afterShuffle.substring(3, 9);
        System.out.print(result);
        return result;
    }
    // 发送验证码
    public String sendEamilCode(String eamil) {
        HtmlEmail send = new HtmlEmail();
        String resultCode = achieveCode();
        try {
            send.setHostName("smtp.qq.com");  //           
            send.setSmtpPort(465); //                                           //端口号
            send.setSSLOnConnect(true);//                                 //开启SSL加密
            send.setCharset("utf-8");
            send.addTo(eamil);                                  //接收者的QQEamil
            send.setFrom("731118710@qq.com", "TSG");//       //第一个参数是发送者的QQEamil   第二个参数是发送者QQ昵称
            send.setAuthentication("731118710@qq.com", "wjvbmiiiueypbdfi"); //第一个参数是发送者的QQEamil   第二个参数是刚刚获取的授权码

            send.setSubject("TSG注册验证"); //Eamil的标题  第一个参数是我写的判断上下午，删掉即可
            send.setMsg("验证码为:   " + resultCode); //Eamil的内容
            send.send(); //发送
        } catch (EmailException e) {
            e.printStackTrace();
        }
        return resultCode;  //同等验证码
    }
    @Test
    public void  MyEcluic(){

        sendEamilCode("1742892917@qq.com");
    }

}
