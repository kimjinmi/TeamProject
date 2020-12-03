package com.mycompany.webapp.dto;

import java.util.Date;

public class AnnounceDto {

	private int ano;
	private String memail;
	private String atitle;
	private String acontent;
	private Date adate;
	private boolean aifmain;

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public Date getAdate() {
		return adate;
	}

	public void setAdate(Date adate) {
		this.adate = adate;
	}

	public boolean isAifmain() {
		return aifmain;
	}

	public void setAifmain(boolean aifmain) {
		this.aifmain = aifmain;
	}

	
}
