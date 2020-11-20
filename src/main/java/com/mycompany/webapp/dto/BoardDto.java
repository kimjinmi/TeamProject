package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardDto {
	private int bno; // 게시글 번호
	private String btitle; // 게시글 제목
	private String bcontent; // 게시글 내용
	private Date bdate; // 게시글 작성 날짜
	private int blike; // 게시글 좋아요
	private String memail; // member email -> 아이디
	private int cno; // Category 번호
	private String bimage; // 게시글 이미지
	
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
	public Date getDate() {
		return bdate;
	}
	public void setDate(Date date) {
		this.bdate = date;
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
