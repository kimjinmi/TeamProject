package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contents")
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@RequestMapping("/contents")
	public String contents() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "contents/contents";
	}
}