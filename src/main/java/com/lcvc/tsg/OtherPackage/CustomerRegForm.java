package com.lcvc.tsg.OtherPackage;

/**
 * @ClassName CustomerRegForm
 * @Author Anle
 * @Date 2018/10/16 0016 下午 5:12
 * @Version 1.0
 * //================================Customer注册提交表单的类-===============================
 **/
public class CustomerRegForm {
    private String inputVerificationCode;//验证码
    private String CustomerName;//用户名

    public String getInputVerificationCode() {
        return inputVerificationCode;
    }

    public void setInputVerificationCode(String inputVerificationCode) {
        this.inputVerificationCode = inputVerificationCode;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String customerName) {
        CustomerName = customerName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getRepassword() {
        return Repassword;
    }

    public void setRepassword(String repassword) {
        Repassword = repassword;
    }

    public String getUserEmail() {
        return UserEmail;
    }

    public void setUserEmail(String userEmail) {
        UserEmail = userEmail;
    }


    private String Password;//密码
    private String Repassword;//确认密码
    private String UserEmail;//用户邮箱
}
