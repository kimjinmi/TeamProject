package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.HomeService;

@Controller

public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private HomeService service;
	
	@RequestMapping("/")
	public String content(HttpSession session, Model model, String memail) { //http://localhost:8080/teamproject
		logger.info("메인페이지 로그인");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		if(sessionMemail!=null) {
		MemberDto member = service.selectbyMemail(sessionMemail);
		model.addAttribute("member", member);
		}
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