package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signin")
public class SigninController {
	private static final Logger logger = LoggerFactory.getLogger(SigninController.class);


	
	@RequestMapping("/content")
	public String content() { //http://localhost:8080/teamproject
		return "signin/content";
	}
	
	@GetMapping("/login")
	public String login() {
		return "signin/content";
	}
	
	/*
	  @RequestMapping("/findpassword") public String findpassword(String memail, Model model) { 
	  logger.info("비밀번호 찾기 실행");
	  
	  String result = service.findPassword; model.addAttribute("memail", memail);
	  return "signin/findpassword"; 
	 }
	 */
	
	@RequestMapping("/resetpassword")
	public String resetpassword() {
		logger.info("실행");
		return "signin/resetpassword";
	}
}
