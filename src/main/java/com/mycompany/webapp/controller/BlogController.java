package com.mycompany.webapp.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.ReplyDto;
import com.mycompany.webapp.service.BlogService;



@Controller
@RequestMapping("/blog")
public class BlogController {
	int bno=0;
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
		 List<CategoryDto> catelist = service.categoryList();			//영아
		 List<BoardDto> btitlelist = service.BoardList();					//영아
		 model.addAttribute("board", board);
		 model.addAttribute("catelist", catelist);								//영아
		 model.addAttribute("btitlelist", btitlelist);							//영아
		 logger.info("날짜형식 테스트 : " + board.getBdate());
		 logger.info("bno 값 출력 1 : " + bno);
		return "blog/blog_details";
	}
	
	@GetMapping("/blogcommentlist")
	public String blogcommentlist(int bno, Model model, HttpServletRequest request) {
		List<ReplyDto> commentlist = service.commentList(bno);
		model.addAttribute("commentlist", commentlist);
		return "blog/blogcommentList";
	}
	
	@RequestMapping("/blog")
	public String blog(HttpSession session, Model model) { //http://localhost:8080/teamproject
		String memail = (String) session.getAttribute("sessionMemail");
		List<BoardDto> list = service.getBoardList(memail);
		List<CategoryDto> catelist = service.categoryList();				//영아
		List<BoardDto> btitlelist = service.BoardList();					//영아
		MemberDto member = service.getMimage(memail);	
		model.addAttribute("list", list);
		model.addAttribute("catelist", catelist);								//영아
		model.addAttribute("btitlelist", btitlelist);	
		model.addAttribute("member", member);//영아
		logger.info(catelist.toString());											//영아
		logger.info("실행");
		return "blog/blog";
	}
	
	@RequestMapping("/blog_write")
	public String blog_write() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog/blog_write";
	}
	

	
}
