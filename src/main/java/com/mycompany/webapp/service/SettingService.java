package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.SettingController;
import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.MemberDto;


@Service
public class SettingService {
	private static final Logger logger = LoggerFactory.getLogger(SettingController.class);

	@Resource
	private MemberDao memberdao;

	public MemberDto sessionconnect(MemberDto member) {
		//logger.info("service: "+member.getMemail());
		MemberDto dbmember = memberdao.selectbyMemail(member.getMemail());
		return dbmember;
		
	}
	
	
}
