package com.mycompany.webapp.view;

public class ReplyDto {

	private	int rno;
	private String rcontent;
	private String firstreply;
	private String memail;
	private int bno;
	
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
	public String getFirstreply() {
		return firstreply;
	}
	public void setFirstreply(String firstreply) {
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
