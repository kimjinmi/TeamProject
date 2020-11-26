package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.SettingController;
import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.PagerDto;


@Service
public class SettingService {
	private static final Logger logger = LoggerFactory.getLogger(SettingController.class);

	@Resource
	private MemberDao memberdao;
	
	@Resource
	private BoardDao boarddao;

	public MemberDto sessionconnect(MemberDto member) {
		//logger.info("service: "+member.getMemail());
		MemberDto dbmember = memberdao.selectbyMemail(member.getMemail());
		return dbmember;
		
	}

	public void membernickintroupdate(MemberDto member) {
		
		logger.info("mnickname: " + member.getMnickname());
		logger.info("mintro : " + member.getMintro());
		memberdao.updatenickintro(member);
	}

	public void memberimageupdate(MemberDto member) {
		logger.info("mmyimage :" + member.getMmyimage());
		memberdao.updateimage(member);
		
		
	}

	public List<BoardDto> getBoardList(PagerDto pager) {
		//List<BoardDto> list = boarddao.selectAll(sessionMemail);
		List<BoardDto> pageList = boarddao.selectByPage(pager);
		return pageList;
	}

	public int getTotalRows() {
		int totalRows = boarddao.countAll();
		return totalRows;
	}

	


	
	
}
