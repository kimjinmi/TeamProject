package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/about")
public class aboutController {
	private static final Logger logger = LoggerFactory.getLogger(aboutController.class);

	@RequestMapping("/content")
	public String content() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "home";
	}
}
