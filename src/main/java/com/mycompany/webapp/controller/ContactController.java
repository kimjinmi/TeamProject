package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contact")
public class ContactController {
	private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

	@RequestMapping("/contact")
	public String contact() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "contact/contact";
	}
}
