package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.AnnounceDao;
import com.mycompany.webapp.dao.InquiryDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dao.ReplyDao;
import com.mycompany.webapp.dto.AnnounceDto;
import com.mycompany.webapp.dto.InquiryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.ReplyDto;

@Service
public class ContactService {
	
	@Resource
	private InquiryDao inquirydao;
	
	@Resource
	private AnnounceDao announcedao;
	
	private static final Logger logger = LoggerFactory.getLogger(ContactService.class);

	public void inquirywrite(InquiryDto inquiry) {
		inquirydao.inquiryinsert(inquiry);
	}

	public List<AnnounceDto> getannouncelist() {
		List<AnnounceDto> list = announcedao.selectlist(); 
		return list;
	}

	public int getTotalAnnounceRows() {
		int count = announcedao.countannounceall();
		return count;
	}

}