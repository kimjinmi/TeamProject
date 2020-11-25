package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.MemberDto;

@Service
public class HomeService {

	@Resource
	private MemberDao memberDao;
	
	public MemberDto selectbyMemail(String memail) {
		MemberDto sessionMemail = memberDao.selectbyMemail(memail);
		return sessionMemail;
	}

}
