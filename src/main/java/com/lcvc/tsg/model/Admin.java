package com.lcvc.tsg.model;

/**
 * @Author JunJi
 * @Date 2018/9/26 11:34
 **/
public class Admin {
    private Integer id; //
    private String admin_name;//管理员名字

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_passwod() {
        return admin_passwod;
    }

    public void setAdmin_passwod(String admin_passwod) {
        this.admin_passwod = admin_passwod;
    }

    public String getAdmin_head() {
        return admin_head;
    }

    public void setAdmin_head(String admin_head) {
        this.admin_head = admin_head;
    }

    public String getAdmin_phone() {
        return admin_phone;
    }

    public void setAdmin_phone(String admin_phone) {
        this.admin_phone = admin_phone;
    }

    public String getAdmin_Email() {
        return admin_Email;
    }

    public void setAdmin_Email(String admin_Email) {
        this.admin_Email = admin_Email;
    }

    public boolean getAdmin_sex() {
        return admin_sex;
    }

    public void setAdmin_sex(boolean admin_sex) {
        this.admin_sex = admin_sex;
    }

    private String admin_passwod; //管理员密码
    private String admin_head; //管理员头像
    private String admin_phone; //管理员手机
    private String admin_Email; //管理员邮箱
    private boolean admin_sex; //管理员性别

}
