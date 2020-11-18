package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/blog_details")
	public String blog_details() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog_details";
	}
	
	@RequestMapping("/blog_write")
	public String blog_write() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog_write";
	}

}
