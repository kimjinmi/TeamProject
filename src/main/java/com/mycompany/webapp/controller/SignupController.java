package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.SignupService;

@Controller
@RequestMapping("/signup")
public class SignupController {
	
	@Resource
	private SignupService service;
	
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	@RequestMapping("/content")
	public String content() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "signup/signupcheck";
	}
	
	@RequestMapping("/test")
		public String test() {
			/*	MemberDto mememail = service.getMemail();*/
			
			logger.info("test실행");
			return "signup/signup";
		}
	
}
