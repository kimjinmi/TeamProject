package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.ReplyDto;
import com.mycompany.webapp.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {

	int bno = 0;
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

	@PostMapping("/blogcommentlist")
	public void blogcommentwrite(ReplyDto reply) {
		service.commentWrite(reply);
	}

	@RequestMapping("/blog")
	public String blog(HttpSession session, Model model, HttpServletRequest request) { // http://localhost:8080/teamproject
		// get 값 매핑
		String UserUrl = (String) request.getParameter("UserUrl"); // Get으로 전송받은 useurl의 값을 받는다.
		if (UserUrl == "") {
			UserUrl += session.getAttribute("murl");
		}
		// UserUrl로 memail을 가져온다
		List<BoardDto> list = service.getBoardList(UserUrl);
		logger.info("list 값 : " + list);
		String memail = (String) session.getAttribute("sessionMemail");
		/* List<BoardDto> list = service.getBoardList(memail); */
		List<CategoryDto> catelist = service.categoryListMurl(UserUrl); // 영아
		List<BoardDto> btitlelist = service.BoardList(); // 영아
		MemberDto member = service.getMimage(UserUrl); // UserUrl을 가지고 유저 이미지를 들고온다
		model.addAttribute("list", list);
		model.addAttribute("catelist", catelist); // 영아
		model.addAttribute("btitlelist", btitlelist);
		model.addAttribute("member", member);// 영아
		logger.info(catelist.toString()); // 영아
		logger.info("실행");
		return "blog/blog";
	}

	/*@RequestMapping("/blog_write")
	public String blog_write(HttpSession session, Model model) { //http://localhost:8080/teamproject
		String memail = (String) session.getAttribute("sessionMemail");
		MemberDto member = service.getMimage(memail);
		
		logger.info("실행");
		return "blog/blog_write";
	}*/
	
	@RequestMapping("/categoryListLinkBoard")
	public String categoryListLinkBoard(int cno, String murl, Model model, HttpServletRequest request) {
			logger.info("cno는 : " + cno); // cno 들어옴 성공 완성
			logger.info("murl는 : " + murl); // cno 들어옴 성공 완성
			
			List<BoardDto> bcno = service.bcno(cno, murl);
			model.addAttribute("bcno", bcno);
			//logger.info("cno, userUrl출력 : " + cno, UserUrl);
			
			return "blog/categoryListLinkBoard";
		}
	
	/*
	 * @RequestMapping("/blog_write") public String blog_write(HttpSession session,
	 * Model model) { //http://localhost:8080/teamproject String memail = (String)
	 * session.getAttribute("sessionMemail"); MemberDto member =
	 * service.getMimage(memail);
	 * 
	 * logger.info("실행"); return "blog/blog_write"; }
	 */

	@GetMapping("/boardWrite")
	public String boardWrite(Model model, BoardDto board) {
		List<CategoryDto> category_list = service.categoryList();
		model.addAttribute("category_list", category_list);
		return "blog/boardWriteForm";
	}

	@RequestMapping("boardWrite")
	public void blog_write(BoardDto board, HttpServletResponse response) throws Exception {
		service.boardWrite(board);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();

		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}

	@GetMapping("/blogcommentlist")
	public String blogcommentlist(ReplyDto reply, Model model, HttpServletResponse response, HttpSession session)
			throws IOException {

		/*
		 * if(reply.getRcontent() != null) { logger.info("겟댓글내용");
		 * reply.setMemail((String)session.getAttribute("sessionMemail"));
		 * 
		 * //reply.setMnickname((String)session.getAttribute("SessionMnickname"));
		 * logger.info(reply.getRcontent()); logger.info(reply.getMemail());
		 * logger.info(reply.getMnickname());
		 * 
		 * service.commentWrite(reply);
		 * 
		 * 
		 * }
		 */

		List<ReplyDto> commentlist = service.commentList(reply.getBno());
		logger.info("commentlist 값 = " + commentlist.toString());
		model.addAttribute("commentlist", commentlist);

		return "blog/blogcommentList";

	}
}
