package com.mycompany.webapp.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
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
	
	@RequestMapping("/blog_details")
	public String board_details(Model model) {
		 BoardDto board = service.getBoard(2);
		 model.addAttribute("board", board);
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
	
	/*@GetMapping("/blogLife")
	public String boardList(@RequestParam(defaultValue = "1") int pageNo, Model model) {			//페이지 값을 default값으로 1을 줌, 1페이지로넘어가게
			int totalRows = service.getTotalRows();				//전체 행수를 달라고 서비스에 요청
			Ch14Pager pager = new Ch14Pager(10, 5, totalRows, pageNo);			//pager - page 객체를 만들어야함 / 한 페이지에 나타나는 행수, 그룹당 오는 행수, 전체 행수, 페이지수
			List<Ch14Board> list = service.getBoardList(pager);		
			model.addAttribute("list", list);								//테이블을 만들수 있도록 하기 위해 list를 가져와서 return에 넣어줌
			model.addAttribute("pager", pager);							//jsp에서 이 pager를 사용할 수 있도록 해줌
			return "ch14/boardList";
	}*/
	
	
}
