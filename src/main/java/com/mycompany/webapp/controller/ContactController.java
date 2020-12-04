package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String announcedetail(int ano, int pageNo, Model model) {
		AnnounceDto announce = service.getannounce(ano);
		model.addAttribute("announce", announce);
		model.addAttribute("pageNo", pageNo);
		return "contact/announcedetail";
	}
	
	@RequestMapping("/contactform")
	public void contactform(InquiryDto inquiry, HttpServletResponse response){
		inquiry.setIresult(false);
		service.inquirywrite(inquiry);
		//service.inquirywrite(inquiry);
	}
	
}
