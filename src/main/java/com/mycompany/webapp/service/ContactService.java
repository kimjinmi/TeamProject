package com.mycompany.webapp.service;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.InquiryDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dao.ReplyDao;
import com.mycompany.webapp.dto.InquiryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.ReplyDto;

@Service
public class ContactService {
	
	@Resource
	private InquiryDao inquiryDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ContactService.class);

	public void inquirywrite(InquiryDto inquiry) {
		inquiryDao.inquiryinsert(inquiry);
	}

}