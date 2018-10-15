package com.lcvc.tsg.OtherPackage;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * @ClassName MyEmail
 * @Author Anle
 * @Date 2018/10/15 0015 上午 10:50
 * @Version 1.0
 **/
public class MyEmail {
    private static String server = "smtp.qq.com";
    private static int port = 25;
    private String pop3 = "pop.qq.com";
    public void MysendEmail(String emailFrom, String emailFromPassword, String emailTo, String emailSubject, String body)
    {
        try{
            Properties props = new Properties();
            props.put("mail.smtp.host", server);
            props.put("mail.smtp.port", String.valueOf(port));
            props.put("mail.smtp.auth", "true");
            Transport transport = null;
            Session session = Session.getDefaultInstance(props, null);
            transport = session.getTransport("smtp");
            transport.connect(server, emailFrom, emailFromPassword);
            MimeMessage msg = new MimeMessage(session);
            msg.setSentDate(new Date());
            InternetAddress fromAddress = new InternetAddress(emailFrom);
            msg.setFrom(fromAddress);
            InternetAddress[] toAddress = new InternetAddress[1];
            toAddress[0] = new InternetAddress(emailTo);
            msg.setRecipients(Message.RecipientType.TO, toAddress);
            msg.setSubject(emailSubject, "UTF-8");
            msg.setText(body);
            transport.sendMessage(msg, msg.getAllRecipients());
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    //调这个就可以发送邮件（地址，验证码）
    public void chooseOperation(String EmailTo,String Code) throws Exception{

        MysendEmail("731118710@qq.com", "wjvbmiiiueypbdfi", EmailTo, "TST注册验证", "验证码为：       "+Code);
        System.out.println("邮件发送成功!");

    }


}
