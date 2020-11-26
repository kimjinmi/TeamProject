package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardDto {
	private int bno; // 게시글 번호
	private String btitle; // 게시글 제목
	private String bcontent; // 게시글 내용
	@DateTimeFormat(pattern = "yyyy-MM-dd") private Date bdate; // 게시글 작성 날짜
	private int blike; // 게시글 좋아요	
	private String bimage; // 게	시글 이미지
	private String memail; // member email -> 아이디
	private int cno; // Category 번호
	private String mnickname;
	private String ccontent;
	private String mmyimage;
	private String blinkcontent;
	
	   
	public String getBlinkcontent() {
		return blinkcontent;
	}
	public void setBlinkcontent(String blinkcontent) {
		this.blinkcontent = blinkcontent;
	}
	public String getMmyimage() {
		return mmyimage;
	}
	public void setMmyimage(String mmyimage) {
		this.mmyimage = mmyimage;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBlike() {
		return blike;
	}
	public void setBlike(int blike) {
		this.blike = blike;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getBimage() {
		return bimage;
	}
	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	
}
