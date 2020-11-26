package com.mycompany.webapp.dto;

import java.util.Date;

public class ReplyDto {
	private	int rno; // 댓글 번호
	private String rcontent; // 댓글 내용
	private int firstreply; // 상위 댓글 번호
	private String memail; // member email -> 아이디
	private int bno; // 게시글 번호 
	private Date rdate;
	
	
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	/*
	 * public String getMnickname() { return mnickname; } public void
	 * setMnickname(String mnickname) { this.mnickname = mnickname; }
	 */
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public int getFirstreply() {
		return firstreply;
	}
	public void setFirstreply(int firstreply) {
		this.firstreply = firstreply;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
}
