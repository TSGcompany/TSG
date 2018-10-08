package com.lcvc.tsg.model;

/**
 * @ClassName Reply
 * @Author Anle
 * @Date 2018/10/7 0007 下午 3:08
 * @Version 1.0
 **/
public class Reply {
    private  Integer id;//id
    private Integer comment_id;//回复主题id
    private java.util.Date reply_creatorTime;//回复的时间
    private  String reply_content;//回复的内容
    private Integer respondent_id;//回复者ID

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public java.util.Date getReply_creatorTime() {
        return reply_creatorTime;
    }

    public void setReply_creatorTime(java.util.Date reply_creatorTime) {
        this.reply_creatorTime = reply_creatorTime;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public Integer getRespondent_id() {
        return respondent_id;
    }

    public void setRespondent_id(Integer respondent_id) {
        this.respondent_id = respondent_id;
    }

}
