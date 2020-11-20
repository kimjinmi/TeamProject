package com.mycompany.webapp.dto;

public class CategoryDto {
	private int cno; // Category 번호
	private String ccontent; // Category 내용
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
}
