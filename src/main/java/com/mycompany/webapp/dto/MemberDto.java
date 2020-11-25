package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDto {
	private	String memail; // 아이디
	private String mpassword; // 비밀번호
	private String mnickname; // 닉네임
	private String mphonenum; // 휴대폰 번호
	private String mintro; // 한 줄 소개
	private String mmyimage;	// 프로필사진
	private String mrole; // 권한
	private boolean menabled; // 계정 0(비활성화), 1(활성화)
	private MultipartFile mphotoAttach;
	private String murl="cutesun"; 
	
	
	public String getMurl() {
		return murl;
	}
	public void setMurl(String murl) {
		this.murl = murl;
	}
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
	public MultipartFile getMphotoAttach() {
		return mphotoAttach;
	}
	public void setMphotoAttach(MultipartFile mphotoAttach) {
		this.mphotoAttach = mphotoAttach;
	}

	
	
	
	
	
	
}
