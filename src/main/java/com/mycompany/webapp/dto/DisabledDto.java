package com.mycompany.webapp.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DisabledDto {
	private int dno; // 비활성화 유저 번호
	private String memail; // 비활성화 유저 이메일
	private String dreason; // 비활성화 된 이유
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ddate; // 비활성화된 날짜
	private String mmyimage;
	private String mnickname;

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getDreason() {
		return dreason;
	}

	public void setDreason(String dreason) {
		this.dreason = dreason;
	}

	public Date getDdate() {
		return ddate;
	}

	public void setDate(Date ddate) {
		this.ddate = ddate;
	}

	public String getMmyimage() {
		return mmyimage;
	}

	public void setMmyimage(String mmyimage) {
		this.mmyimage = mmyimage;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
}
