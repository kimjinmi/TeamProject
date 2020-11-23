package com.mycompany.webapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String content(HttpSession session) { //http://localhost:8080/teamproject
		session.setAttribute("UserId", "123@jihoonnara.com");
		logger.info("메인페이지 로그인");
		return "home";
	}
	
	@RequestMapping("/elements")
	public String elements() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "elements";
	}
	
	@RequestMapping("/login")
	public String login() {
		
		return "home";
	}
	
}