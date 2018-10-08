package com.lcvc.tsg.model;

/**
 * @ClassName Book_Type
 * @Author Anle
 * @Date 2018/10/7 0007 下午 12:31
 * @Version 1.0
 **/
public class Book_Type {
    private Integer id;//id
    private String book_type_name;//类型名称
    private Integer Book_Type_priority;// 优先级


    public Integer getBook_Type_priority() {
        return Book_Type_priority;
    }
    public void setBook_Type_priority(Integer book_Type_priority) {
        Book_Type_priority = book_Type_priority;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBook_type_name() {
        return book_type_name;
    }

    public void setBook_type_name(String book_type_name) {
        this.book_type_name = book_type_name;
    }

}
