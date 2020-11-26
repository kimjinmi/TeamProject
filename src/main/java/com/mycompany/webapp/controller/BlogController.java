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
	private int bno = 0;
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
		logger.info("bno 값 확인: " + bno);
		BoardDto board = service.getBoard(bno);
		List<CategoryDto> catelist = service.categoryList(); //영아
		List<ReplyDto> commentlist = service.commentList(bno);
		List<BoardDto> btitlelist = service.BoardList(); //영아
		model.addAttribute("board", board);
		model.addAttribute("catelist", catelist); //영아
		model.addAttribute("commentlist", commentlist);
		model.addAttribute("btitlelist", btitlelist); //영아
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
	public String blog(BoardDto board, HttpSession session, Model model, HttpServletRequest request) { //http://localhost:8080/teamproject
		String memail = (String) session.getAttribute("sessionMemail"); //영아
		List<BoardDto> list = service.getBoardList(memail); //영아
		List<CategoryDto> catelist = service.categoryList(); //영아
		List<BoardDto> btitlelist = service.BoardList();
		//List<BoardDto> clistLink = service.ClistLink(memail, cno);						//영아
		MemberDto member = service.getMimage(memail);
		/*board.setMemail(memail);													//영아
		board.setCno(cno);*/ //영아
		model.addAttribute("list", list);
		model.addAttribute("catelist", catelist); //영아
		model.addAttribute("btitlelist", btitlelist);
		model.addAttribute("member", member); //영아 - "member" request범위에 저장되는 이름
		//model.addAttribute("clistlink", clistLink);								//영아
		logger.info(catelist.toString()); //영아
		logger.info("실행");
		return "blog/blog";
	}

	@RequestMapping("/blog_write")
	public String blog_write() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog/blog_write";
	}

	/*@GetMapping("/test")
	public String testfunction(int cno, HttpSession session) {
		// 카테고리 넘버 얻었고
		// 멤버의 이메일 필요함 // murl   ->  디비에 들고가서 select ~ from ~ where  memail = #{memal}, m
		//데이터 베이스에서 내가 원하는 값은 cno의 카테고리에서 내가 접속해있는 블로그의 게시글
		// 카테고리넘버, memail
		
		String memail = (String) session.getAttribute("sessionMemail");
		
		List<BoardDto> test = service.test(memail); // Servcie -> Dao -> XML -> 쿼리문실행  -> 결과 돌아와
		// memail이 피영아가 작성한 글이 다 나오겠자
		// 결과는 니가 다 작성한거
		return null;
	}*/

	/*	@GetMapping("/test")
		public String test (HttpSession session, Model model) {
				String memail = (String)session.getAttribute("sessionMemail");
				List<BoardDto> clistlink = service.ClistLink(memail);
				model.addAttribute("clistlink", clistlink);
				return "blog/test";
		}*/

	@GetMapping("/test")
	public String test (HttpSession session, Model model,int cno) {
			logger.info("cno출력"+cno);
			return "blog/test";
	}

}
