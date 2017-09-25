package com.zdnet.domain;

import java.util.Date;

public class MusicComment {
    private Integer mcid;

    private String mccontent;

    private Date mcentereddate;

    private Integer mcstar;

    private Integer mid;

    private Integer uid;

    public Integer getMcid() {
        return mcid;
    }

    public void setMcid(Integer mcid) {
        this.mcid = mcid;
    }

    public String getMccontent() {
        return mccontent;
    }

    public void setMccontent(String mccontent) {
        this.mccontent = mccontent == null ? null : mccontent.trim();
    }

    public Date getMcentereddate() {
        return mcentereddate;
    }

    public void setMcentereddate(Date mcentereddate) {
        this.mcentereddate = mcentereddate;
    }

    public Integer getMcstar() {
        return mcstar;
    }

    public void setMcstar(Integer mcstar) {
        this.mcstar = mcstar;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}