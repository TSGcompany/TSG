package com.lcvc.tsg.model;

/**
 * @ClassName Collection
 * @Author Anle
 * @Date 2018/11/6 0006 下午 8:02
 * @Version 1.0
 * =========================================收藏表=======================================
 **/
public class MyCollection {
    private Integer id;
    private String collection_bookNumber;//书的编号

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCollection_bookNumber() {
        return collection_bookNumber;
    }

    public void setCollection_bookNumber(String collection_bookNumber) {
        this.collection_bookNumber = collection_bookNumber;
    }

    public String getCollection_bookName() {
        return collection_bookName;
    }

    public void setCollection_bookName(String collection_bookName) {
        this.collection_bookName = collection_bookName;
    }

    public String getCollection_bookIcon() {
        return collection_bookIcon;
    }

    public void setCollection_bookIcon(String collection_bookIcon) {
        this.collection_bookIcon = collection_bookIcon;
    }



    private  String collection_bookName;//书名
    private  String collection_bookIcon;//书图片

    public boolean isIscollection() {
        return iscollection;
    }

    public void setIscollection(boolean iscollection) {
        this.iscollection = iscollection;
    }

    private  boolean iscollection;//是否已经借

    public Customer getCollection_customerId() {
        return collection_customerId;
    }

    public void setCollection_customerId(Customer collection_customerId) {
        this.collection_customerId = collection_customerId;
    }

    private  Customer collection_customerId;//用户id
}
