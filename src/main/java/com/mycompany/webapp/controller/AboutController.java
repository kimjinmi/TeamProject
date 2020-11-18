package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/aboutus")
public class AboutController {
	private static final Logger logger = LoggerFactory.getLogger(AboutController.class);

	@RequestMapping("/about")
	public String about() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "aboutus/about";
		//선명이 push!!!
		// 선이 push!!!
		// 영아 push!!!
	}
}
