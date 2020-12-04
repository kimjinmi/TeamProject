package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.SigninService;

@Controller
@RequestMapping("/signin")
public class SigninController {
	private static final Logger logger = LoggerFactory.getLogger(SigninController.class);

	@Resource
	private SigninService service;
	
	@RequestMapping("/content")
	public String content() { //http://localhost:8080/teamproject
		return "signin/content";
	}
	
	@GetMapping("/login")
	public String login() {
		return "signin/content";
	}
	
	@RequestMapping("/findemail")
	public String findemail() {
	logger.info("실행");
		return "signin/findemail";
	}
	
	@RequestMapping("/findemailresult")
	public String findemailresult(String mphonenum, Model model) {
		logger.info(mphonenum);
		MemberDto member = service.findMemail(mphonenum); 
		logger.info(member.getMemail());
		model.addAttribute("member", member);
		
		return "signin/findemailresult";
	}
	
	@RequestMapping("/findpassword") 
	  public String findpassword() { 
	  
	  return "signin/findpassword"; 
	 }
	
	@RequestMapping("/findpasswordform") 
	  public String findpasswordform(MemberDto member) { 
		int result = service.findMpassword(member);
		if(result==1) {
			return "signin/resetpassword";
		}else {
			return "signin/wrongpassword";
		}
		
	   
	 }
	 
	@RequestMapping("/passwordresult")
	public void passwordresult(String mpassword, HttpServletResponse response) throws Exception {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();	//비밀번호 암호화에 필요한 객체
		String encodedPassword = passwordEncoder.encode(mpassword);	
		//service
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();

		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
		
		
	}
	
	
	@RequestMapping("/passwordreset")
	public String passwordreset() {
		logger.info("실행");
		return "signin/passwordreset";
	}
}
