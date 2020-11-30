package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String board_details(HttpSession session, int bno, Model model, HttpServletRequest request) {
		// get 값 매핑
		/*String UserUrl = (String) request.getParameter("UserUrl"); // Get으로 전송받은 useurl의 값을 받는다. -지훈
		if (UserUrl == "") {
			UserUrl += session.getAttribute("murl");
		}*/
		
		 bno = Integer.parseInt(request.getParameter("bno"));
		 //logger.info("bno 값 확인: "+bno);
		 BoardDto board = service.getBoard(bno);
		 String UserUrl = board.getMurl();
		 logger.info("###############"+board.getMurl());
		 List<CategoryDto> catelist = service.categoryListMurl(UserUrl); 
		 List<BoardDto> likelist = service.bLikeList(UserUrl);			//영아		
		 model.addAttribute("board", board);
		 model.addAttribute("catelist", catelist);								//영아
		 model.addAttribute("likelist", likelist);
		 MemberDto member = service.getMimage(UserUrl); 	
		 model.addAttribute("member", member);	
		 logger.info("날짜형식 테스트 : " + board.getBdate());
		 logger.info("bno 값 출력 1 : " + bno);
		 logger.info("해당 게시글의 좋아요는 : " + board.getBlike());

		return "blog/blog_details";
	}

	@PostMapping("/blogcommentlist")
	public void blogcommentwrite(ReplyDto reply) {
		service.commentWrite(reply);
	}

	@RequestMapping("/blog")
	public String blog(String murl, HttpSession session, Model model, HttpServletRequest request) { // http://localhost:8080/teamproject
		// get 값 매핑
		String UserUrl = (String) request.getParameter("UserUrl"); // Get으로 전송받은 useurl의 값을 받는다. -지훈
		if (UserUrl == "") {
			UserUrl += session.getAttribute("murl");
		}
		// UserUrl로 memail을 가져온다
		List<BoardDto> list = service.getBoardList(UserUrl);
		logger.info("list 값 : " + list);
		String memail = (String) session.getAttribute("sessionMemail");
		List<CategoryDto> catelist = service.categoryListMurl(UserUrl); 				// 영아
		List<BoardDto> likelist = service.bLikeList(UserUrl);			//영아
		MemberDto member = service.getMimage(UserUrl); 									// UserUrl을 가지고 유저 이미지를 들고온다
		model.addAttribute("list", list);
		model.addAttribute("catelist", catelist);													 // 영아
		model.addAttribute("member", member);													// 영아
		model.addAttribute("likelist", likelist);													// 영아
		logger.info(catelist.toString()); 																// 영아
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
	
	
	//영아 - 보드 게시물 / 이메일 & cno 가 맞을 때 리스트 링크연결
	@RequestMapping("/categoryListLinkBoard")	
	public String categoryListLinkBoard(int cno, String murl, Model model, HttpServletRequest request) {			
			logger.info("실행되는건가");
			List<BoardDto> bcno = service.bcno(cno, murl);
			model.addAttribute("bcno", bcno);
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

	
	//--------------------------- (선) 게시물 쓰기 시작 -------------------------
	@GetMapping("/boardWrite")
	public String boardWrite(Model model, BoardDto board) {
		List<CategoryDto> category_list = service.categoryList();
		model.addAttribute("category_list", category_list);
		return "blog/boardWriteForm";
	}

	@RequestMapping("boardWrite")
	public void blog_write(HttpSession session, BoardDto board, HttpServletResponse response) throws Exception {	
		String SessionMurl =(String) session.getAttribute("SessionMurl");
		board.setMurl(SessionMurl);
		board.setBlike(0);
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
	
	@RequestMapping(value = "fileupload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
	    response.setCharacterEncoding("utf-8"); // 한글깨짐을 방지하기위해 문자셋 설정
	    response.setContentType("text/html; charset=utf-8");  // 마찬가지로 파라미터로 전달되는 response 객체의 한글 설정
	    String fileName = upload.getOriginalFilename();    // 업로드한 파일 이름
	    byte[] bytes = upload.getBytes();  // 파일을 바이트 배열로 변환
	
	    String uploadPath = "C:/temp/projectimage/board";  // 이미지를 업로드할 디렉토리
	    
	    OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
	    out.write(bytes);
	    
	    String callback = request.getParameter("CKEditorFuncNum");  // 클라이언트에 결과 표시
	
	    PrintWriter printWriter = response.getWriter();
	    String fileUrl = request.getContextPath() + "/images/" + fileName;
	    printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
	            + "','이미지가 업로드되었습니다.')" + "</script>");
	    printWriter.flush();
	}
	
	//--------------------------- (선) 게시물 쓰기 끝 -------------------------

	
	//////////////////////// 김지훈 댓글 리스트 시작 //////////////////////////
	@GetMapping("/blogcommentlist")
	public String blogcommentlist(ReplyDto reply, Model model, HttpServletResponse response, HttpSession session) throws IOException {
		  if(reply.getRcontent() != null) { 
		  reply.setMemail((String)session.getAttribute("sessionMemail"));
		  service.commentWrite(reply); 
		  }
			int bbno = reply.getBno();
			List<ReplyDto> commentlist = service.commentList(bbno);
			logger.info("getBno = " + bbno);
			logger.info("commentlist 값 = " + commentlist.toString());
			model.addAttribute("commentlist", commentlist);
			return "blog/blogcommentList";

	}
	
	@GetMapping("/photodownload")
	public void photodownload(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info(fileName);
		
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/temp/projectimage/member/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		
		//응답 HTTP 헤더 구성
		//1) Content-Type 헤더 구성(파일 종류)
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType(fileType);
		
		//다운로드할 실제 파일 이름 구성
		//split메소드는 배열로 리턴됨

		//attachment; : 브라우저가 해당 파일을 다운로드(없으면 보여줄 수 있으면 브라우저에서 보여줌, 보여줄 수 없으면 다운로드
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");
		
		//3)Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
		int fileSize = (int) new File(saveFilePath).length();
		response.setContentLength(fileSize);
		
		//응답 HTTP의 바디(본문) 구성
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os); //스프링에서 제공
		os.flush();
		os.close();
		is.close();
	}

	@GetMapping("/commentDelete")
	public void commentDelete(int rno) {
		logger.info("나와라 commentDelete Rno = " + rno);
		service.commentDelete(rno);		
	}

}
