package com.mycompany.webapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String content() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "home";
	}
	
	@RequestMapping("/elements")
	public String elements() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "elements";
	}
	
	@RequestMapping("/sessionconnect")
	public String sessionconnect() { //http://localhost:8080/teamproject
		return "sessionconnect";
	}
	
	@PostMapping("/sessionconnectForm")
	public String sessionconnectForm(HttpServletRequest request, HttpSession session) { //http://localhost:8080/teamproject
		String value = request.getParameter("value");
		logger.info("value :" + value);
		session.setAttribute("sessionMemail", value);
			
			
		return "home";
	}
}