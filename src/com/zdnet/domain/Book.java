package com.zdnet.domain;

import java.util.Date;

public class Book {
    private Integer bid;

    private String bname;

    private String bauthor;

    private String bintroduction;

    private Date bentereddate;

    private Date bpublishdate;

    private String bpublisher;

    private String bpicaddr;

    private Integer biscream;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname == null ? null : bname.trim();
    }

    public String getBauthor() {
        return bauthor;
    }

    public void setBauthor(String bauthor) {
        this.bauthor = bauthor == null ? null : bauthor.trim();
    }

    public String getBintroduction() {
        return bintroduction;
    }

    public void setBintroduction(String bintroduction) {
        this.bintroduction = bintroduction == null ? null : bintroduction.trim();
    }

    public Date getBentereddate() {
        return bentereddate;
    }

    public void setBentereddate(Date bentereddate) {
        this.bentereddate = bentereddate;
    }

    public Date getBpublishdate() {
        return bpublishdate;
    }

    public void setBpublishdate(Date bpublishdate) {
        this.bpublishdate = bpublishdate;
    }

    public String getBpublisher() {
        return bpublisher;
    }

    public void setBpublisher(String bpublisher) {
        this.bpublisher = bpublisher == null ? null : bpublisher.trim();
    }

    public String getBpicaddr() {
        return bpicaddr;
    }

    public void setBpicaddr(String bpicaddr) {
        this.bpicaddr = bpicaddr == null ? null : bpicaddr.trim();
    }

    public Integer getBiscream() {
        return biscream;
    }

    public void setBiscream(Integer biscream) {
        this.biscream = biscream;
    }

	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bname=" + bname + ", bauthor=" + bauthor
				+ ", bintroduction=" + bintroduction + ", bentereddate="
				+ bentereddate + ", bpublishdate=" + bpublishdate
				+ ", bpublisher=" + bpublisher + ", bpicaddr=" + bpicaddr
				+ ", biscream=" + biscream + "]";
	}

	public Book(Integer bid, String bname, String bauthor,
			String bintroduction, Date bentereddate, Date bpublishdate,
			String bpublisher, String bpicaddr, Integer biscream) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.bauthor = bauthor;
		this.bintroduction = bintroduction;
		this.bentereddate = bentereddate;
		this.bpublishdate = bpublishdate;
		this.bpublisher = bpublisher;
		this.bpicaddr = bpicaddr;
		this.biscream = biscream;
	}
    public Book(){
    	
    };
    
}