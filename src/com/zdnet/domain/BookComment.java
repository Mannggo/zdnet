package com.zdnet.domain;

import java.util.Date;

public class BookComment {
    private Integer bcid;

    private String bccontent;

    private Date bcentereddate;

    private Integer bcstar;

    private Integer uid;

    private Integer bid;

    public Integer getBcid() {
        return bcid;
    }

    public void setBcid(Integer bcid) {
        this.bcid = bcid;
    }

    public String getBccontent() {
        return bccontent;
    }

    public void setBccontent(String bccontent) {
        this.bccontent = bccontent == null ? null : bccontent.trim();
    }

    public Date getBcentereddate() {
        return bcentereddate;
    }

    public void setBcentereddate(Date bcentereddate) {
        this.bcentereddate = bcentereddate;
    }

    public Integer getBcstar() {
        return bcstar;
    }

    public void setBcstar(Integer bcstar) {
        this.bcstar = bcstar;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }
}