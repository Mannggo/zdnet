package com.zdnet.domain;

import java.util.Date;

public class Activity {
    private Integer aid;

    private String aname;

    private Date aholddate;

    private String aholdplace;

    private Integer apersonlimit;

    private Integer aispass;

    private String aintroduction;

    private String aunit;

    private Integer uid;

    private Date adeadline;

    private Date aentereddate;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname == null ? null : aname.trim();
    }

    public Date getAholddate() {
        return aholddate;
    }

    public void setAholddate(Date aholddate) {
        this.aholddate = aholddate;
    }

    public String getAholdplace() {
        return aholdplace;
    }

    public void setAholdplace(String aholdplace) {
        this.aholdplace = aholdplace == null ? null : aholdplace.trim();
    }

    public Integer getApersonlimit() {
        return apersonlimit;
    }

    public void setApersonlimit(Integer apersonlimit) {
        this.apersonlimit = apersonlimit;
    }

    public Integer getAispass() {
        return aispass;
    }

    public void setAispass(Integer aispass) {
        this.aispass = aispass;
    }

    public String getAintroduction() {
        return aintroduction;
    }

    public void setAintroduction(String aintroduction) {
        this.aintroduction = aintroduction == null ? null : aintroduction.trim();
    }

    public String getAunit() {
        return aunit;
    }

    public void setAunit(String aunit) {
        this.aunit = aunit == null ? null : aunit.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getAdeadline() {
        return adeadline;
    }

    public void setAdeadline(Date adeadline) {
        this.adeadline = adeadline;
    }

    public Date getAentereddate() {
        return aentereddate;
    }

    public void setAentereddate(Date aentereddate) {
        this.aentereddate = aentereddate;
    }
}