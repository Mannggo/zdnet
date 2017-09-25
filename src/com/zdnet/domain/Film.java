package com.zdnet.domain;

import java.util.Date;

public class Film {
    private Integer fid;

    private String fname;

    private String factor;

    private String fintroduction;

    private Date fentereddate;

    private Date frundate;

    private String fauthor;

    private String fpicaddr;

    private Integer fiscream;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname == null ? null : fname.trim();
    }

    public String getFactor() {
        return factor;
    }

    public void setFactor(String factor) {
        this.factor = factor == null ? null : factor.trim();
    }

    public String getFintroduction() {
        return fintroduction;
    }

    public void setFintroduction(String fintroduction) {
        this.fintroduction = fintroduction == null ? null : fintroduction.trim();
    }

    public Date getFentereddate() {
        return fentereddate;
    }

    public void setFentereddate(Date fentereddate) {
        this.fentereddate = fentereddate;
    }

    public Date getFrundate() {
        return frundate;
    }

    public void setFrundate(Date frundate) {
        this.frundate = frundate;
    }

    public String getFauthor() {
        return fauthor;
    }

    public void setFauthor(String fauthor) {
        this.fauthor = fauthor == null ? null : fauthor.trim();
    }

    public String getFpicaddr() {
        return fpicaddr;
    }

    public void setFpicaddr(String fpicaddr) {
        this.fpicaddr = fpicaddr == null ? null : fpicaddr.trim();
    }

    public Integer getFiscream() {
        return fiscream;
    }

    public void setFiscream(Integer fiscream) {
        this.fiscream = fiscream;
    }
}