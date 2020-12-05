package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.validator.MemberValidator;



@Service
public class SignupService {
	private static final Logger logger = LoggerFactory.getLogger(SignupService.class);
	
	@Resource
	private MemberDao memberDao;

	public MemberDto getMemail(String memail) {
		MemberDto mememail = memberDao.selectbyMemail(memail);
		return mememail;
	}

	public int checkMemail(String memail) {
		int result = memberDao.countMemail(memail);
		return result;
	}

	public int nicknamecheck(String mnickname) {
		logger.info(mnickname);
		int result = memberDao.countMnickname(mnickname);
		return result;
		
	}

	public void signup(MemberDto member) {
		memberDao.insert(member);
		
	}
	
}
