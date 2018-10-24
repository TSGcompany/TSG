package com.lcvc.tsg.model;

import java.util.Date;

/**
 * @ClassName Borrowing
 * @Author Anle
 * @Date 2018/10/7 0007 下午 3:03
 * @Version 1.0
 **/
public class Borrowing {
    private Integer id;//id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getCustomer_Id() {
        return customer_Id;
    }

    public void setCustomer_Id(Customer customer_Id) {
        this.customer_Id = customer_Id;
    }

    public Date getBorrowing_Time() {
        return borrowing_Time;
    }

    public void setBorrowing_Time(Date borrowing_Time) {
        this.borrowing_Time = borrowing_Time;
    }

    public Date getBorrowing_Return_Time() {
        return borrowing_Return_Time;
    }

    public void setBorrowing_Return_Time(Date borrowing_Return_Time) {
        this.borrowing_Return_Time = borrowing_Return_Time;
    }

    public boolean isBorrowing_Return() {
        return borrowing_Return;
    }

    public void setBorrowing_Return(boolean borrowing_Return) {
        this.borrowing_Return = borrowing_Return;
    }

    public Book getBook_id() {
        return book_id;
    }

    public void setBook_id(Book book_id) {
        this.book_id = book_id;
    }

    private Customer customer_Id;//借阅者的id
    private  java.util.Date borrowing_Time;//借阅的时间.
    private  java.util.Date borrowing_Return_Time;//还书的时间
    private  boolean borrowing_Return;//是否归还
    private Book book_id;//书的编号


}
