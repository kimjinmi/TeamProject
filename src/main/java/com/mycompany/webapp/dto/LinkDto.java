package com.mycompany.webapp.dto;

public class LinkDto {
	private int lno; // Link 번호
	private String lcontent; // Link 내용
	private int bno; // board 게시글 번호
	
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	public String getLcontent() {
		return lcontent;
	}
	public void setLcontent(String lcontent) {
		this.lcontent = lcontent;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
}
