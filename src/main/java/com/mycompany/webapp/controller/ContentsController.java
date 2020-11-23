package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.service.ContentsService;

@Controller
@RequestMapping("/contents")
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@RequestMapping("/contents")
	public String contents() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "contents/contents";
	}
	@Resource private ContentsService service;
	
	@GetMapping("/contents")
	public String boardList(Model model) {
		List<BoardDto> list = service.getBoardList();
		model.addAttribute("list", list);
		return "contents/contents";
	}
	
	@GetMapping("/category/life")
	public String life(Model model) {
		List<BoardDto> list = service.getBoardListCno(1); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "contents/category/life";
	}
	
	@GetMapping("/category/travle")
	public String travle(Model model) {
		List<BoardDto> list = service.getBoardListCno(2); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "contents/category/travle";
	}
	
	@GetMapping("/category/culture")
	public String culture(Model model) {
		List<BoardDto> list = service.getBoardListCno(3); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "contents/category/culture";
	}
	
	@GetMapping("/category/it")
	public String it(Model model) {
		List<BoardDto> list = service.getBoardListCno(4); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "contents/category/it";
	}
	
	@GetMapping("/category/sports")
	public String sports(Model model) {
		List<BoardDto> list = service.getBoardListCno(5); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "contents/category/sports";
	}
	
	@GetMapping("/category/current")
	public String current(Model model) {
		List<BoardDto> list = service.getBoardListCno(6); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "contents/category/current";
	}
}
