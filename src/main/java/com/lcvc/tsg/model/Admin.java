package com.lcvc.tsg.model;

/**
 * @Author JunJi
 * @Date 2018/9/26 11:34
 **/
public class Admin {
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

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
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

    public boolean isAdmin_sex() {
        return admin_sex;
    }

    public void setAdmin_sex(boolean admin_sex) {
        this.admin_sex = admin_sex;
    }

    public String getAdmin_nickname() {
        return admin_nickname;
    }

    public void setAdmin_nickname(String admin_nickname) {
        this.admin_nickname = admin_nickname;
    }

    private Integer id; //
    private String admin_name;//管理员名字
    private String admin_password; //管理员密码
    private String admin_head; //管理员头像
    private String admin_phone; //管理员手机
    private String admin_Email; //管理员邮箱
    private boolean admin_sex; //管理员性别
    private String admin_nickname;//管理员昵称



}
