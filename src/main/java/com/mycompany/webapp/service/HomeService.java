package com.mycompany.webapp.service;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.MemberDto;

@Service
public class HomeService {
	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);
	
	@Resource
	private MemberDao memberDao;


	public MemberDto getMemberInfo(String sessionMemail) {
		MemberDto memberinfo = memberDao.selectbyMemail(sessionMemail);
		return memberinfo;
	}
	
	public MemberDto selectbyMemail(String memail) {
		MemberDto sessionMemail = memberDao.selectbyMemail(memail);
		return sessionMemail;
	}
}
