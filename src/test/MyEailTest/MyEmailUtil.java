package com.lcvc.tsg.MyEailTest;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.Properties;

/**
 * @ClassName MyEmailUtil
 * @Author Anle
 * @Date 2018/10/14 0014 下午 9:12
 * @Version 1.0
 **/
public class MyEmailUtil {
    private static String server = "smtp.163.com";
    private static int port = 25;
    private String pop3 = "pop.163.com";

    public void sendEmail(String emailFrom, String emailFromPassword, String emailTo, String emailSubject, String body,
                          String fileName) {
        try {
            File f = new File(fileName);
            String fName = f.getName();
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

            MimeMultipart multi = new MimeMultipart();
            BodyPart textBodyPart = new MimeBodyPart(); //第一个BodyPart.主要写一些一般的信件内容。
            textBodyPart.setText(body);
//            压入第一个BodyPart到MimeMultipart对象中。
            multi.addBodyPart(textBodyPart);
            FileDataSource fds = new FileDataSource(fileName); //必须存在的文档，否则throw异常。
            BodyPart fileBodyPart = new MimeBodyPart(); //第二个BodyPart
            fileBodyPart.setDataHandler(new DataHandler(fds)); //字符流形式装入文件
            fileBodyPart.setFileName(fName); //设置文件名，可以不是原来的文件名。
            multi.addBodyPart(fileBodyPart);
//            MimeMultPart作为Content加入message
            msg.setContent(multi);
            msg.setFileName(fileName);
            msg.saveChanges();

            transport.sendMessage(msg, msg.getAllRecipients());
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void sendEmail(String emailFrom, String emailFromPassword, String emailTo, String emailSubject, String body)
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

    public void receiveEmail(String pop3, String user, String password) throws Exception {
        Properties props = System.getProperties();
        Session session = Session.getInstance(props, null);
        Store store = session.getStore("pop3");
        store.connect(pop3, user, password);
        Folder folder = store.getFolder("INBOX");
        folder.open(Folder.READ_WRITE);
        Message[] msg = folder.getMessages();
        for (int i = 0; i < msg.length; i++) {
            System.out.println("来自: " + msg[i].getFrom()[0]);
            System.out.println("标题: " + msg[i].getSubject());
            System.out.println("内容: " + msg[i].getContent() + "\n");
            if(((msg[i].getFrom()[0]).toString()).equalsIgnoreCase("865247114@qq.com")) {
                String s;
                BufferedReader in = new BufferedReader(new InputStreamReader(msg[i].getInputStream()));
                System.out.println("-----Mail Text-----");
                while(!(s=in.readLine()).equals("")) {
                    System.out.println(s);
                }
                in.close();
            }
        }
        folder.close(false);
        store.close();
    }

    public String getUserInputFromCMD(String s) throws Exception {
        System.out.println(s);
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String b;
        b = br.readLine();
        String userInput = b.trim();
        return userInput;
    }

    public String[] getUserInputFromTxt(File file) throws Exception {
        FileReader fr =new FileReader(file);
        BufferedReader br = new BufferedReader(fr);
        String data;
        String[] userInfo = new String[2];
        int i = 0;
        while((data = br.readLine()) != null) {
            userInfo[i] = data;
            i++;
        }
        return userInfo;
    }

    public void chooseOperation(MyEmailUtil iMailMan) throws Exception {
        System.out.println("请选择你要执行的操作：1.发送带附件邮件   2.发送没有携带附件的邮件    3.接收邮件  4.退出");
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        char a = (char) br.read();
        switch (a) {
            case '1' : {
                String emailTo = iMailMan.getUserInputFromCMD("请输入收件人的邮箱: ");
                String emailSubject = iMailMan.getUserInputFromCMD("请输入邮件的标题: ");
                String emailContent = iMailMan.getUserInputFromCMD("请输入邮件的内容: ");
                String fileName = iMailMan.getUserInputFromCMD("请输入附件的路径,路径中的'\\'请加上转义字符: ");
                //从文件里获取邮箱的账户和密码
                String[] userInfo = iMailMan.getUserInputFromTxt(new File("D:\\sendEmail.txt"));
              //  String userInfo01 = iMailMan.getUserInputFromCMD("测试！");
                String emailFrom = userInfo[0];
                String emailFromPassword = userInfo[1];
                iMailMan.sendEmail(emailFrom, emailFromPassword, emailTo, emailSubject, emailContent, fileName);
                System.out.println("邮件发送成功!");
                iMailMan.chooseOperation(iMailMan);
            }
            break;
            case '2' : {
                String emailTo = iMailMan.getUserInputFromCMD("请输入收件人的邮箱: ");
                String emailSubject = iMailMan.getUserInputFromCMD("请输入邮件的标题: ");
                String emailContent = iMailMan.getUserInputFromCMD("请输入邮件的内容: ");
                //从文件里获取邮箱的账户和密码
                String[] userInfo = iMailMan.getUserInputFromTxt(new File("D:\\sendEmail.txt"));
                String emailFrom = userInfo[0];
                String emailFromPassword = userInfo[1];
                iMailMan.sendEmail(emailFrom, emailFromPassword, emailTo, emailSubject, emailContent);
                System.out.println("邮件发送成功!");
                iMailMan.chooseOperation(iMailMan);
            }
            break;
            case '3' : {
                //从文件里获取邮箱的账户和密码
                String[] userInfo = iMailMan.getUserInputFromTxt(new File("D:\\receiveEmail.txt"));
                String user = userInfo[0];
                String password = userInfo[1];
                iMailMan.receiveEmail(pop3, user, password);
                System.out.println("邮件接收成功!");
                iMailMan.chooseOperation(iMailMan);
            }
            break;
            case '4' : break;
        }
    }

    public static void main(String[] args) {
        MyEmailUtil iMailMan = new MyEmailUtil();
        try {
            iMailMan.chooseOperation(iMailMan);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
