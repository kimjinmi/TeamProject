package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog")
public class BlogController {
	private static final Logger logger = LoggerFactory.getLogger(BlogController.class);

	@RequestMapping("/blog")
	public String blog() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog/blog";
	}
	
	@RequestMapping("/blog_write")
	public String blog_write() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog/blog_write";
	}
}
