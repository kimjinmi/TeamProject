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
import com.mycompany.webapp.service.RankingService;

@Controller
@RequestMapping("/ranking")
public class RankingController {
	private static final Logger logger = LoggerFactory.getLogger(RankingController.class);
	@Resource private RankingService service;
	
	@GetMapping("/ranking")
		public String boardList(Model model) {
			logger.info("실행");	
			List<BoardDto> list = service.getBoardList(); // 서비스에 BoardList를 달라고 요청
			model.addAttribute("list", list); 
			return "ranking/ranking"; // view가 html 조각을 만들어준다.
	}
	
	@GetMapping("/boardList")
	public String life(int cno, Model model) {
		List<BoardDto> list = service.getBoardListCno(cno); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "ranking/boardList";
	}
	
}
