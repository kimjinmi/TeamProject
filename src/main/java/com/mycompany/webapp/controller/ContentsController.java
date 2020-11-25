package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.service.ContentsService;

@Controller
@RequestMapping("/contents")
public class ContentsController {
	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Resource private ContentsService service;
	
	@GetMapping("/contents")
	public String boardList(Model model) {
		logger.info("실행");
		List<BoardDto> list = service.getBoardList();
		List<CategoryDto> category_list = service.getCategoryList(); 
		model.addAttribute("list", list);
		model.addAttribute("category_list", category_list);
		return "contents/contents";
	}
	
	@GetMapping("/boardList")
	public String life(int cno, Model model) {
		List<BoardDto> list = service.getBoardListCno(cno); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "contents/boardList";
	}
	

}
