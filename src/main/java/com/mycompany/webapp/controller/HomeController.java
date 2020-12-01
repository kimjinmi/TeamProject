package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.HomeService;

@Controller
public class HomeController {
	
	@Resource
	private HomeService homeService;
	
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
			logger.info(member.getMnickname());
			
			session.setAttribute("SessionMnickname", member.getMnickname());
			session.setAttribute("SessionMurl", member.getMurl());
		}
		return "home";
	}
	
	@RequestMapping("/elements")
	public String elements() { //http://localhost:8080/teamproject
	
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
		
		
		// 로그인이 되었을때 작동되어야 할 코드 ** 수정 금지 ** 김지훈 작성 ***********************************************************

		String sessionMemail = (String) session.getAttribute("sessionMemail"); // 로그인하고 로그인했을 경우 로그인 아이디를 세션에 저장
		logger.info("현재 세션의 sessionMemail은 " + sessionMemail); // 됬고
		
		
		MemberDto member = homeService.getMemberInfo(sessionMemail); // 세션 아이디의 값으로 아이디에 해당하는 유저의 정보를 가져온다.
		logger.info("Member 객체의 값 : "  + member.toString());
		
		String UserUrl = member.getMurl(); // 가져온 정보중 세션 유저의 murl 정보만 획득
		logger.info("######################       member의 Muri = " + member.getMurl());
		session.setAttribute("UserUrl", UserUrl); // 유저의 정보중에서 MURL만 세션에 넣는다.
		/*
		
		// 김지훈 작성 // 수정 금지 *****************************************************************************************
	*/
		return "home";
	}
}