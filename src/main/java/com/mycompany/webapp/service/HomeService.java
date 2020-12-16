package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.MemberDto;

@Service
public class HomeService {
	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);
	
	@Resource
	private MemberDao memberDao;

	@Resource
	private BoardDao boardDao;

	public MemberDto getMemberInfo(String sessionMemail) { // 세션이메일이 들어온다
		MemberDto memberinfo = memberDao.selectByMurl(sessionMemail);
		return memberinfo;
	}
	
	public MemberDto selectbyMemail(String Memail) {
		MemberDto SessionMemail = memberDao.selectbyMemail(Memail);
		return SessionMemail;
	}

	
	// home에 보이는 Ranking 순위 
	public List<BoardDto> getHomeRanking() {
		List<BoardDto> list = boardDao.selectHomeAll();
		return list;
	}
}