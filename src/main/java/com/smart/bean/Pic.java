package com.smart.bean;

public class Pic {
    private int id;
    private String comEmail;
    private String pic;
    private String mark;
    private String state;

    public Pic(){

    }

    public Pic(String comEmail, String pic, String mark) {
        this.comEmail = comEmail;
        this.pic = pic;
        this.mark = mark;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComEmail() {
        return comEmail;
    }

    public void setComEmail(String comEmail) {
        this.comEmail = comEmail;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
