package com.mycompany.webapp.dto;

public class MemberDto {
	private	String memail;
	private String mpassword;
	private String mnickname;
	private String mphonenum;
	private String mintro;
	private String mmyimage;	
	private String mrole;
	private boolean menabled;
	
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getMphonenum() {
		return mphonenum;
	}
	public void setMphonenum(String mphonenum) {
		this.mphonenum = mphonenum;
	}
	public String getMintro() {
		return mintro;
	}
	public void setMintro(String mintro) {
		this.mintro = mintro;
	}
	public String getMmyimage() {
		return mmyimage;
	}
	public void setMmyimage(String mmyimage) {
		this.mmyimage = mmyimage;
	}
	public String getMrole() {
		return mrole;
	}
	public void setMrole(String mrole) {
		this.mrole = mrole;
	}
	public boolean isMenabled() {
		return menabled;
	}
	public void setMenabled(boolean menabled) {
		this.menabled = menabled;
	}
	
	
	
}
