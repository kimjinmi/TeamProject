package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dao.ReplyDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.ReplyDto;

@Service
public class HomeService {
	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);
	
	@Resource
	private MemberDao memberDao;


	public MemberDto getMemberInfo(String sessionMemail) {
		MemberDto memberinfo = memberDao.selectbyMemail(sessionMemail);
		return memberinfo;
	}
}
