package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class InquiryDto {
	
	private int ino;
	private String isubject;
	private String imessage;
	private String iemail;
	private boolean iresult;
	@DateTimeFormat(pattern = "yyyy-MM-dd") private Date idate;
	
	
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getIsubject() {
		return isubject;
	}
	public void setIsubject(String isubject) {
		this.isubject = isubject;
	}
	public String getImessage() {
		return imessage;
	}
	public void setImessage(String imessage) {
		this.imessage = imessage;
	}
	public String getIemail() {
		return iemail;
	}
	public void setIemail(String iemail) {
		this.iemail = iemail;
	}
	public boolean isIresult() {
		return iresult;
	}
	public void setIresult(boolean iresult) {
		this.iresult = iresult;
	}
	public Date getIdate() {
		return idate;
	}
	public void setIdate(Date idate) {
		this.idate = idate;
	}
	
	

}
