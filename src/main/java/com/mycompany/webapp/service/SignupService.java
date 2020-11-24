package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.MemberDto;



@Service
public class SignupService {
	
	@Resource
	private MemberDao memberDao;

	public MemberDto getMemail(String memail) {
		MemberDto mememail = memberDao.selectbyMemail(memail);
		return mememail;
	}
	
}