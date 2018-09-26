package com.lcvc.tsg.model;

/**
 * @ClassName Book
 * @Author JunJI
 * @Date2018/9/25 22:01
 **/
public class Book {
    private Integer id; //id
    private int book_id; //书的编号
    private String book_name; //书名
    private String book_icon; //书的图片
    private int book_number; //书的数量
    private String book_author; //书的作者
    private String book_type; //书的类型
    private int book_hotID; //书的热度
    private int book_creatorID; //书的发布者
    private int book_editorsID; //书的最后编辑者
    private java.util.Date book_release_Date; //书的添加时间
    private int book_commentID; //书的评论
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public int getBook_id() {
        return book_id;
    }
    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }
    public String getBook_name() {
        return book_name;
    }
    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }
    public String getBook_icon() {
        return book_icon;
    }
    public void setBook_icon(String book_icon) {
        this.book_icon = book_icon;
    }
    public int getBook_number() {
        return book_number;
    }
    public void setBook_number(int book_number) {
        this.book_number = book_number;
    }
    public String getBook_author() {
        return book_author;
    }
    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }
    public String getBook_type() {
        return book_type;
    }
    public void setBook_type(String book_type) {
        this.book_type = book_type;
    }
    public int getBook_hotID() {
        return book_hotID;
    }
    public void setBook_hotID(int book_hotID) {
        this.book_hotID = book_hotID;
    }
    public int getBook_creatorID() {
        return book_creatorID;
    }
    public void setBook_creatorID(int book_creatorID) {
        this.book_creatorID = book_creatorID;
    }
    public int getBook_editorsID() {
        return book_editorsID;
    }
    public void setBook_editorsID(int book_editorsID) {
        this.book_editorsID = book_editorsID;
    }
    public java.util.Date getBook_release_Date() {
        return book_release_Date;
    }
    public void setBook_release_Date(java.util.Date book_release_Date) {
        this.book_release_Date = book_release_Date;
    }
    public int getBook_commentID() {
        return book_commentID;
    }
    public void setBook_commentID(int book_commentID) {
        this.book_commentID = book_commentID;
    }
}
