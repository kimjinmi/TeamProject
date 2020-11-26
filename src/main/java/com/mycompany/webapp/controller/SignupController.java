package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.SignupService;

@Controller
@RequestMapping("/signup")
public class SignupController {

	@Resource
	private SignupService service;

	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	
	@RequestMapping("/signupcheck")
	public String signupcheck() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "signup/signupcheck";
	}

	/*	@RequestMapping("/signup")
		public String signup() {
				MemberDto mememail = service.getMemail();
			
			logger.info("test실행");
			return "signup/signup";
		}*/

	@PostMapping("/signupcheckform")
	public String signupcheckform(String paramemail,Model model) {
		logger.info("성공");
		
		int result = service.checkMemail(paramemail);
		model.addAttribute("Memail", paramemail);
		if(result==0) {
			return "signup/signup";
		}else {
			return "signup/regist";
		}
	}
	
	@RequestMapping("/nicknamecheck")
	public void nicknamecheck(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String mnickname = request.getParameter("mnickname");
		logger.info(mnickname);
		/*int result = service.nicknamecheck(mnickname);
		logger.info("result:"+result);
		JSONObject jsonObject = new JSONObject();
		if(result==0) {
			jsonObject.put("result", "success");
		}else {
			jsonObject.put("result", "fail");
		}
		String json = jsonObject.toString(); // {"result" : "success"}
		
		//응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();*/
		
	}
	
	@PostMapping("/signupform")
	public String signupform(MemberDto member) {
		logger.info("성공");
		logger.info(member.getMpassword());
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodePassword = passwordEncoder.encode(member.getMpassword());
		member.setMpassword(encodePassword);
		String origin = member.getMnickname();		
		member.setMintro("안녕하세요");
		member.setMmyimage("default.PNG");
		member.setMenabled(true);
		member.setMrole("ROLE_USER");
		String save = new Date().getTime() + "_" + origin;
		member.setMurl(save);
		service.signup(member);
		return "signup/success";
		
	}

}
