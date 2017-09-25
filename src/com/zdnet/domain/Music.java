package com.zdnet.domain;

import java.util.Date;

public class Music {
    private Integer mid;

    private String mname;

    private Date mrundate;

    private String msinger;

    private String mauthor;

    private Date mentereddate;

    private String mpicaddr;

    private Integer miscream;

    private String mfileaddr;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname == null ? null : mname.trim();
    }

    public Date getMrundate() {
        return mrundate;
    }

    public void setMrundate(Date mrundate) {
        this.mrundate = mrundate;
    }

    public String getMsinger() {
        return msinger;
    }

    public void setMsinger(String msinger) {
        this.msinger = msinger == null ? null : msinger.trim();
    }

    public String getMauthor() {
        return mauthor;
    }

    public void setMauthor(String mauthor) {
        this.mauthor = mauthor == null ? null : mauthor.trim();
    }

    public Date getMentereddate() {
        return mentereddate;
    }

    public void setMentereddate(Date mentereddate) {
        this.mentereddate = mentereddate;
    }

    public String getMpicaddr() {
        return mpicaddr;
    }

    public void setMpicaddr(String mpicaddr) {
        this.mpicaddr = mpicaddr == null ? null : mpicaddr.trim();
    }

    public Integer getMiscream() {
        return miscream;
    }

    public void setMiscream(Integer miscream) {
        this.miscream = miscream;
    }

    public String getMfileaddr() {
        return mfileaddr;
    }

    public void setMfileaddr(String mfileaddr) {
        this.mfileaddr = mfileaddr == null ? null : mfileaddr.trim();
    }
}