package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NeighborDto {

	int nno;		//이웃 번호
	String mymemail;		//내 이메일	
	String nememail;		//이웃 이메일
	@DateTimeFormat(pattern = "yyyy-MM-dd") private Date ndate; //  이웃 된 날짜
	String nemurl;		//이웃 murl
	
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
