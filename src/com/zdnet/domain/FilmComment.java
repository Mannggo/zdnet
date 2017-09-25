package com.zdnet.domain;

import java.util.Date;

public class FilmComment {
    private Integer fcid;

    private String fccontent;

    private Integer fcstar;

    private Date fcentereddate;

    private Integer uid;

    private Integer fid;

    public Integer getFcid() {
        return fcid;
    }

    public void setFcid(Integer fcid) {
        this.fcid = fcid;
    }

    public String getFccontent() {
        return fccontent;
    }

    public void setFccontent(String fccontent) {
        this.fccontent = fccontent == null ? null : fccontent.trim();
    }

    public Integer getFcstar() {
        return fcstar;
    }

    public void setFcstar(Integer fcstar) {
        this.fcstar = fcstar;
    }

    public Date getFcentereddate() {
        return fcentereddate;
    }

    public void setFcentereddate(Date fcentereddate) {
        this.fcentereddate = fcentereddate;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }
}