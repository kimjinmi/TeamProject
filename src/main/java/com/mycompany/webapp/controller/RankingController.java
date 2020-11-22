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

	@RequestMapping("/ranking")
	public String ranking() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "ranking/ranking";
	}
	
	@Resource private RankingService service;
	
	@GetMapping("/ranking")
	public String boardList(Model model) {
		List<BoardDto> list = service.getBoardList(); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		// list(안에 board 객체가 있음)라는 이름으로 이 객체를 사용할 수 있다	-> 	<c:forEach var="board" items="${list}">	
		return "ranking/ranking"; // view가 html 조각을 만들어준다.
	}
	
	@GetMapping("/category/life")
	public String life(Model model) {
		List<BoardDto> list = service.getBoardListCno(1); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "ranking/category/life";
	}
	
	@GetMapping("/category/travle")
	public String travle(Model model) {
		List<BoardDto> list = service.getBoardListCno(2); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "ranking/category/travle";
	}
	
	@GetMapping("/category/culture")
	public String culture(Model model) {
		List<BoardDto> list = service.getBoardListCno(3); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "ranking/category/culture";
	}
	
	@GetMapping("/category/it")
	public String it(Model model) {
		List<BoardDto> list = service.getBoardListCno(4); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "ranking/category/it";
	}
	
	@GetMapping("/category/sports")
	public String sports(Model model) {
		List<BoardDto> list = service.getBoardListCno(5); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "ranking/category/sports";
	}
	
	@GetMapping("/category/current")
	public String current(Model model) {
		List<BoardDto> list = service.getBoardListCno(6); // 서비스에 BoardList를 달라고 요청
		model.addAttribute("list", list); 
		return "ranking/category/current";
	}
}
