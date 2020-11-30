package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NeighborDto {

	private int nno;		//이웃 번호
	private String mymemail;		//내 이메일	
	private String nememail;		//이웃 이메일
	@DateTimeFormat(pattern = "yyyy-MM-dd") private Date ndate; //  이웃 된 날짜
	private String nemurl;		//이웃 murl
	private String mmyimage;
	private String mnickname;
	
	
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getMmyimage() {
		return mmyimage;
	}
	public void setMmyimage(String mmyimage) {
		this.mmyimage = mmyimage;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getMymemail() {
		return mymemail;
	}
	public void setMymemail(String mymemail) {
		this.mymemail = mymemail;
	}
	public String getNememail() {
		return nememail;
	}
	public void setNememail(String nememail) {
		this.nememail = nememail;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public String getNemurl() {
		return nemurl;
	}
	public void setNemurl(String nemurl) {
		this.nemurl = nemurl;
	}
	
	
}
