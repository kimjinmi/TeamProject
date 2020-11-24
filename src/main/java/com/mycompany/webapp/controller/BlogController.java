package com.mycompany.webapp.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.ReplyDto;
import com.mycompany.webapp.service.BlogService;



@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@Resource
	private DataSource dataSource;
	@Resource
	private BlogService service;

	
	private static final Logger logger = LoggerFactory.getLogger(BlogController.class);

	@GetMapping("/dbConnect")
	public String dbConnect() {
		
		Connection connect;
		try {
			connect = dataSource.getConnection();
			connect.close();
			logger.info("dbConnected");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "blog/blog_details";
	} 
	
	@GetMapping("/blog_details")
	public String board_details(Model model, HttpServletRequest request) {
		 int bno = Integer.parseInt(request.getParameter("bno"));
		 logger.info("bno 값 확인: "+bno);
		 BoardDto board = service.getBoard(bno);
		 List<CategoryDto> catelist = service.categoryList();
		 List<ReplyDto> commentlist = service.commentList(bno);
		 List<BoardDto> btitlelist = service.BoardList();
		 model.addAttribute("board", board);
		 model.addAttribute("catelist", catelist);
		 model.addAttribute("commentlist", commentlist);
		 model.addAttribute("btitlelist", btitlelist);
		 logger.info("날짜형식 테스트 : " + board.getBdate());
		return "blog/blog_details";
	}
	
	@RequestMapping("/blog")
	public String blog(Model model) { //http://localhost:8080/teamproject
		
		List<BoardDto> list = service.getBoardList("sunny@nara.com");
		List<CategoryDto> catelist = service.categoryList();
		model.addAttribute("list", list);
		model.addAttribute("catelist", catelist);
		logger.info(catelist.toString());
		logger.info("실행");
		
		return "blog/blog";
	}
	
	@RequestMapping("/blog_write")
	public String blog_write() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog/blog_write";
	}
	

	
}
