package com.zdnet.domain;

import java.util.Date;

public class User {
    private Integer uid;

    private String upassword;


    private String upicaddr;

    private String unickname;

    private Date uentereddate;

    private String uemail;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword == null ? null : upassword.trim();
    }


    public String getUpicaddr() {
        return upicaddr;
    }

    public void setUpicaddr(String upicaddr) {
        this.upicaddr = upicaddr == null ? null : upicaddr.trim();
    }

    public String getUnickname() {
        return unickname;
    }

    public void setUnickname(String unickname) {
        this.unickname = unickname == null ? null : unickname.trim();
    }

    public Date getUentereddate() {
        return uentereddate;
    }

    public void setUentereddate(Date uentereddate) {
        this.uentereddate = uentereddate;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail == null ? null : uemail.trim();
    }
}