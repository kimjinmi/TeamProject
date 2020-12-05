package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.SignupService;
import com.mycompany.webapp.validator.MemberValidator;

@Controller
@RequestMapping("/signup")
public class SignupController {

	@Resource
	private SignupService service;

	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);

	/*@ModelAttribute("signup")
	public*/
	
	@RequestMapping("/signupcheck")
	public String signupcheck() { //http://localhost:8080/teamproject
		return "signup/signupcheck";
	}


	@PostMapping("/signupcheckform")
	public String signupcheckform(String paramemail,Model model, MemberDto member) {
		logger.info("성공");
		
		int result = service.checkMemail(paramemail);
		member.setMemail(paramemail);
		model.addAttribute("member", member);
		if(result==0) {
			return "redirect:/signup/signup?memail="+paramemail;
		}else {
			return "redirect:/signup/regist";
		}
	}
	
	@RequestMapping("/nicknamecheck")
	public void nicknamecheck(String memail, String mnickname, MemberDto member, Model model, HttpServletResponse response) throws Exception {
		int row = service.nicknamecheck(mnickname);
		member.setMemail(memail);
		member.setMnickname(mnickname);
		model.addAttribute("member", member);
		
		JSONObject jsonObject = new JSONObject(); //배열[]로 만들어지면 JSONArray
		if(row == 1) {
			jsonObject.put("result", "fail");
		}else if(row != 1) {
			jsonObject.put("result", "success");
		}
			String json = jsonObject.toString(); // {"result" : "success"}
			
			//응답보내기
			PrintWriter out = response.getWriter();
			response.setContentType("application/json;charset=utf-8");
			out.print(json);
			out.flush();
			out.close();
		
	}
	@RequestMapping("/signup")
	public String signup(String memail, MemberDto member, Model model) {
		member.setMemail(memail);
		model.addAttribute("member", member);
		return "signup/signup";
	}
			
	
	
	@InitBinder("membervalidation")
	public void membervalidation(WebDataBinder binder) {
		binder.setValidator(new MemberValidator());
	}
	
	
	@PostMapping("/signupform")
	public String signupform(@ModelAttribute("membervalidation") @Valid MemberDto member,
		 BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
			return "signup/signup";
		}
		
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodePassword = passwordEncoder.encode(member.getMpassword());
		member.setMpassword(encodePassword);
		String origin = member.getMnickname();		
		member.setMintro("안녕하세요");
		member.setMmyimage("default.PNG");
		member.setMenabled(true);
		member.setMrole("ROLE_USER");
		String arr[] = member.getMemail().split("@");
		String edit = arr[1].substring(0,arr[1].indexOf("."));
		String editend = arr[1].substring(arr[1].indexOf(".")+1);
		String murl = arr[0] + edit + editend;
		member.setMurl(murl);
		service.signup(member);
		model.addAttribute("member", member);
		return "redirect:/signup/success";
		
	}

}
