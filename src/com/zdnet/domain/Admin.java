package com.zdnet.domain;

public class Admin {
    private Integer aid;

    private String account;

    private String apassword;

    private Integer aisroot;

    private String arealname;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getApassword() {
        return apassword;
    }

    public void setApassword(String apassword) {
        this.apassword = apassword == null ? null : apassword.trim();
    }

    public Integer getAisroot() {
        return aisroot;
    }

    public void setAisroot(Integer aisroot) {
        this.aisroot = aisroot;
    }

    public String getArealname() {
        return arealname;
    }

    public void setArealname(String arealname) {
        this.arealname = arealname == null ? null : arealname.trim();
    }
}