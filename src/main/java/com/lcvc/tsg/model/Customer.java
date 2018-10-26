package com.lcvc.tsg.model;

public class Customer {
    private Integer id;
    private String customer_name;//用户名字

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_password() {
        return customer_password;
    }

    public void setCustomer_password(String customer_password) {
        this.customer_password = customer_password;
    }

    public String getCustomer_head() {
        return customer_head;
    }

    public void setCustomer_head(String customer_head) {
        this.customer_head = customer_head;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public String getCustomer_Email() {
        return customer_Email;
    }

    public void setCustomer_Email(String customer_Email) {
        this.customer_Email = customer_Email;
    }

    public boolean isCustomer_sex() {
        return customer_sex;
    }

    public void setCustomer_sex(boolean customer_sex) {
        this.customer_sex = customer_sex;
    }

    public boolean isCustomer_prohibit_Login() {
        return customer_prohibit_Login;
    }

    public void setCustomer_prohibit_Login(boolean customer_prohibit_Login) {
        this.customer_prohibit_Login = customer_prohibit_Login;
    }

    public boolean isCustomer_prohibit_Borrowing() {
        return customer_prohibit_Borrowing;
    }

    public void setCustomer_prohibit_Borrowing(boolean customer_prohibit_Borrowing) {
        this.customer_prohibit_Borrowing = customer_prohibit_Borrowing;
    }

    public String getCustomer_nickname() {
        return customer_nickname;
    }

    public void setCustomer_nickname(String customer_nickname) {
        this.customer_nickname = customer_nickname;
    }

    private String customer_password;//用户密码
    private String customer_head;//头像
    private String customer_phone;//用户手机号
    private String customer_Email;//用户邮箱
    private boolean customer_sex;//用户性别
    private boolean customer_prohibit_Login;//禁止登陆
    private boolean customer_prohibit_Borrowing;//禁止借书
    private String customer_nickname;//用户昵称



}
