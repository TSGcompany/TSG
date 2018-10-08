package com.lcvc.tsg.model;

import java.util.Date;

/**
 * @ClassName Comment
 * @Author Anle
 * @Date 2018/10/7 0007 下午 3:03
 * @Version 1.0
 **/
public class Comment {
    private Integer id;//id
    private Customer  customer_id;//用户id
    private  Book book_id;//书的id
    private  String comment_Theme;//评论主题
    private  String comment_Theme_Return;//回复标题
    private java.util.Date comment_creatorTime;//创建的时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Customer customer_id) {
        this.customer_id = customer_id;
    }

    public Book getBook_id() {
        return book_id;
    }

    public void setBook_id(Book book_id) {
        this.book_id = book_id;
    }

    public String getComment_Theme() {
        return comment_Theme;
    }

    public void setComment_Theme(String comment_Theme) {
        this.comment_Theme = comment_Theme;
    }

    public String getComment_Theme_Return() {
        return comment_Theme_Return;
    }

    public void setComment_Theme_Return(String comment_Theme_Return) {
        this.comment_Theme_Return = comment_Theme_Return;
    }

    public Date getComment_creatorTime() {
        return comment_creatorTime;
    }

    public void setComment_creatorTime(Date comment_creatorTime) {
        this.comment_creatorTime = comment_creatorTime;
    }
}
