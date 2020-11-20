package com.mycompany.webapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/setting")
public class SettingController {
	private static final Logger logger = LoggerFactory.getLogger(SettingController.class);

	@RequestMapping("/content")
	public String content() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "setting/content";
	}
	
	@RequestMapping("/mybloglist")
	public String mybloglist() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "setting/mybloglist";
	}
	
	@RequestMapping("/mycommentlist")
	public String mycommentlist() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "setting/mycommentlist";
	}
	
	@RequestMapping("/delete")
	public String delete() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "setting/delete";
	}
	
	@RequestMapping("/ex_login")
	public String ex_login(HttpSession session) {
		String memail ="jinmikim88@gmail.com";
		session.setAttribute("memail", memail);		
		return "setting/content";
	}
	
	@RequestMapping("/ex_logout")
	public String ex_logout(HttpSession session) {
		session.invalidate();		
		return "setting/content";
	}

}
