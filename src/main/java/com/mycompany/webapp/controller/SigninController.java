package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signin")
public class SigninController {
	private static final Logger logger = LoggerFactory.getLogger(SigninController.class);

	@RequestMapping("/content")
	public String content() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "signin/content";
	}
	
	@RequestMapping("/passwordfind")
	public String passwordfind() {
		logger.info("실행");
		return "signin/passwordfind";
	}
	
	@RequestMapping("/passwordreset")
	public String passwordreset() {
		logger.info("실행");
		return "signin/passwordreset";
	}
	
	@GetMapping("/login")
	public String login() {
		logger.info("실행");
		return "signin/content";
	}
	
}
