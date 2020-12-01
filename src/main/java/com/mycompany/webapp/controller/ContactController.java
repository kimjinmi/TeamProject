package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.InquiryDto;
import com.mycompany.webapp.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactController {
	private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

	@Resource
	private ContactService service;
	
	@RequestMapping("/contact")
	public String contact(HttpSession session, Model model) { //http://localhost:8080/teamproject
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		if(sessionMemail != null) {
			model.addAttribute("sessionMemail", sessionMemail);
			logger.info("실행");
		}
		return "contact/contact";
	}
	
	@RequestMapping("/contactform")
	public void contactform(InquiryDto inquiry, HttpServletResponse response){
		inquiry.setIresult(false);
		service.inquirywrite(inquiry);
		logger.info(inquiry.getIsubject());
		logger.info(inquiry.getImessage());
		logger.info(inquiry.getIemail());
		//service.inquirywrite(inquiry);
	}
	
}
