package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.InquiryDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.AnnounceDto;
import com.mycompany.webapp.service.ContactService;

@Controller
@RequestMapping("/contact")
public class ContactController {
	private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

	@Resource
	private ContactService service;
	
	@RequestMapping("/contact")
	public String contact(HttpSession session, Model model) { //http://localhost:8080/teamproject
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		if(sessionMemail != null) {
			model.addAttribute("sessionMemail", sessionMemail);
		}
		return "contact/contact";
	}
	
	@RequestMapping("/announcelist")
	public String announcelist(@RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
		int totalRows = service.getTotalAnnounceRows();
		PagerDto pager = new PagerDto(8, 5, totalRows, pageNo);
		List<AnnounceDto> list = service.getannouncelist(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		return "contact/announcelist";
	}
	@RequestMapping("/announcedetail")
	public String announcedetail(int ano, Model model) {
		AnnounceDto announce = service.getannounce(ano);
		service.updatehitnum(ano);
		model.addAttribute("announce", announce);
		
		return "contact/announcedetail";
	}
	
	@RequestMapping("/contactform")
	public void contactform(InquiryDto inquiry, HttpServletResponse response){
		inquiry.setIresult(false);
		service.inquirywrite(inquiry);
		//service.inquirywrite(inquiry);
	}
	
	@GetMapping("/announcewrite")
	public String announcewrite(Model model, HttpSession session) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		return "contact/announcewrite";
	}
	
	@RequestMapping("/announcewriteform")
	public void announcewriteform(Model model, HttpSession session, AnnounceDto announcedto, HttpServletResponse response) throws IOException {
		announcedto.setAhitnum(0);
		service.announceadd(announcedto);
		//JSON 생성
		JSONObject jsonObject = new JSONObject(); //배열[]로 만들어지면 JSONArray
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); // {"result" : "success"}
		
		//응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/announceedit")
	public String announceedit(int ano, HttpSession session, Model model){
		
		AnnounceDto announcedto = service.getannounce(ano);

		model.addAttribute("announcedto", announcedto);
		return "contact/announceedit";
	
	}
	@RequestMapping("/announceeditform")	
	public void announceeditform(Model model, HttpSession session, AnnounceDto announcedto, HttpServletResponse response) throws Exception {
		service.announceedit(announcedto);
		//JSON 생성
		JSONObject jsonObject = new JSONObject(); //배열[]로 만들어지면 JSONArray
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); // {"result" : "success"}
		
		//응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/announcedelete")
	public void announcedelete(int ano, HttpServletResponse response) throws Exception {
		service.announcedelete(ano);
		//JSON 생성
		JSONObject jsonObject = new JSONObject(); //배열[]로 만들어지면 JSONArray
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); // {"result" : "success"}
		
		//응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
}
