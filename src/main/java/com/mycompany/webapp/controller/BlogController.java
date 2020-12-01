package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
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
import com.mycompany.webapp.dto.NeighborDto;
import com.mycompany.webapp.dto.PagerDto;
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
		/*
		 * String UserUrl = (String) request.getParameter("UserUrl"); // Get으로 전송받은
		 * useurl의 값을 받는다. -지훈 if (UserUrl == "") {
		 * 
		 * UserUrl += session.getAttribute("murl"); }
		 */
		
		 bno = Integer.parseInt(request.getParameter("bno"));
		 //logger.info("bno 값 확인: "+bno);
		 BoardDto board = service.getBoard(bno);
		 String UserUrl = board.getMurl(); 
		 logger.info("###############"+board.getMurl());
		 List<CategoryDto> catelist = service.categoryListMurl(UserUrl); 
		 logger.info("###############"+board.getMurl());
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
		logger.info(reply.getRcontent());
		service.commentWrite(reply);
	}

	@RequestMapping("/blog")
	public String blog(@RequestParam(defaultValue="1")int pageNo, String murl, HttpSession session, Model model, HttpServletRequest request) { // http://localhost:8080/teamproject
		// get 값 매핑
		String UserUrl = (String) request.getParameter("UserUrl"); // Get으로 전송받은 useurl의 값을 받는다. -지훈
		if (UserUrl == "") {
			UserUrl += session.getAttribute("murl");
		}
		// UserUrl로 memail을 가져온다
		/* List<BoardDto> list = service.getBoardList(UserUrl); */
		
		//진미(친구추가버튼)
		String memail = (String) session.getAttribute("sessionMemail");
		String SessionMurl = (String) session.getAttribute("SessionMurl");
		int existRows = -1;
		if(!SessionMurl.equals(UserUrl)){
			existRows = service.neighorexist(UserUrl, memail);
		}
		model.addAttribute("existRows", existRows);
		
		int totalRows = service.getTotalRows(UserUrl); // 개인당 블로그 게시물 수 
		logger.info("토탈 : " + totalRows);
		PagerDto pager = new PagerDto(UserUrl, 3, 5, totalRows, pageNo); // 페이저로 게시물 가져오기
		 List<BoardDto> list = service.getBoardList(pager); 
		logger.info("list 값 : " + list);
		
		
		List<CategoryDto> catelist = service.categoryListMurl(UserUrl); 				// 영아
		List<BoardDto> likelist = service.bLikeList(UserUrl);			//영아
		MemberDto member = service.getMimage(UserUrl); 									// UserUrl을 가지고 유저 이미지를 들고온다
		/* model.addAttribute("list", list); */
		model.addAttribute("catelist", catelist);													 // 영아
		model.addAttribute("member", member);	
		// 영아
		model.addAttribute("likelist", likelist);													// 영아
		logger.info(catelist.toString()); 																// 영아
		logger.info("blog.jsp 컨트롤러 실행");
		logger.info(member.getMurl());
		return "blog/blog";
	}
	

	//영아 - 보드 게시물 / 이메일 & cno 가 맞을 때 리스트 링크연결
	@RequestMapping("/categoryListLinkBoard")	
	public String categoryListLinkBoard(int cno, String murl, Model model, HttpServletRequest request) {			
			List<BoardDto> bcno = service.bcno(cno, murl);
			model.addAttribute("bcno", bcno);
			return "blog/categoryListLinkBoard";
		}

	/*@RequestMapping("/blog_write")
	public String blog_write(HttpSession session, Model model) { //http://localhost:8080/teamproject
		String memail = (String) session.getAttribute("sessionMemail");
		MemberDto member = service.getMimage(memail);
		
		logger.info("실행");
		return "blog/blog_write";
	}*/
	

	
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
	public void blog_write(Model model, MultipartFile attach, HttpSession session, BoardDto board, HttpServletResponse response) throws Exception {			
		if (!attach.isEmpty()) {
			String saveFileName = new Date().getTime() + "_" + attach.getOriginalFilename();
			attach.transferTo(new File("C:/temp/projectimage/board/" + saveFileName));
			board.setBimage(saveFileName);
		}
		
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
		
		/*String SessionMurl =(String) session.getAttribute("SessionMurl");
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
		out.close();*/
	}
	
	@RequestMapping("/upload")
	public void upload(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		if(!upload.isEmpty()) {
			String originalFileName = upload.getOriginalFilename();
			originalFileName += new Date().getTime() + "-" + originalFileName;
			//File saveFile = new File("D:/MyWorkspace/photo/board/" + originalFileName);
			File saveFile = new File("C:/temp/projectimage/boardContent/" + originalFileName);
			upload.transferTo(saveFile);
			jsonObject.put("uploaded", 1);
			jsonObject.put("fileName", originalFileName);
			jsonObject.put("url", "http://localhost:8080/teamproject/blog/boardImageDownload?fileName=" + originalFileName);
		} 
		String json = jsonObject.toString();
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
	
	@GetMapping("/boardImageDownload")
	public void boardImageDownload(String fileName, HttpServletResponse response, HttpServletRequest request) throws Exception {
		// 파일의 데이터를 읽기 위한 입력 스트림 얻기
		//String saveFilePath = "D:/MyWorkspace/photo/board/" + fileName;
		String saveFilePath = "C:/temp/projectimage/boardContent/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);

		// Content-Type 헤더 구성 (파일의 종류)
		String fileType = request.getServletContext().getMimeType(fileName);
		response.setContentType(fileType);

		// 응답 HTTP의 본문 구성 (body)
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}	
	
	@PostMapping("/boardDelete")
	public void boardDelete(int bno, HttpServletResponse response) throws IOException {
		
		// 게시물 삭제
		service.boardDelete(bno);

		// JSON 생성
		JSONObject jsonObject = new JSONObject(); 
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); 

		// JSON 응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
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
	public String commentDelete(int rno) {
		logger.info("나와라 commentDelete Rno = " + rno);
		service.commentDelete(rno);	 // 해당 rno 삭제완료
		return "blog/blogcommentList";
	}
	
	@GetMapping("/heartStatus")
	public String heartStatus(int bno, Model model, HttpSession session) {
		BoardDto likecount = service.boardLikeCount(bno); // 해당 bno 게시물의 blike 갯수를 model.addAttribute("likecount", likecount);
		 String SessionMemail = (String) session.getAttribute("SessionMemail");
		 int heartCheck = service.heartCheck(SessionMemail, bno); 
		
		 logger.info("하트체크 : " + heartCheck);
		 model.addAttribute("heartCheck", heartCheck);
		 model.addAttribute("likecount", likecount);
		return "blog/heartSatatus";
	}

	
	@GetMapping("/blogList")
	public String blogList(@RequestParam(defaultValue="1")int pageNo, String murl, Model model) {
		logger.info("blogList 컨트롤러 실행");
		int totalRows = service.getTotalRows(murl); // 개인당 블로그 게시물 수 
		PagerDto pager = new PagerDto(murl, 2, 5, totalRows, pageNo);
		List<BoardDto> list = service.getBoardList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "blog/blogList";
	}
	
	//진미 친구추가구현
	@RequestMapping("/neighborAdd")
	public void neighborAdd(NeighborDto neighbor,HttpSession session, HttpServletResponse response) throws Exception {
		String memail = (String) session.getAttribute("sessionMemail");
		neighbor.setMymemail(memail);
		service.addneighbor(neighbor);
		//JSON 생성
		JSONObject jsonObject = new JSONObject(); //배열[]로 만들어지면 JSONArray
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); // {"result" : "success"}
		
		//응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();

	}
	
	@PostMapping("/heartClick")
	public String heartClick(int bno, HttpSession session, int heartCheck) {
		
		// 검정 하트일때만 실행
		if(heartCheck  == 0) {
		logger.info("좋아요 더하기");
		service.likeadd(bno);
		service.likeinfo(bno, (String) session.getAttribute("sessionMemail"));
		}else if(heartCheck > 0) {
		// 빨간 하트일때만 실행
			logger.info("좋아요 빼기");
		service.likedsub(bno);
		service.likeinfoDelete(bno, (String) session.getAttribute("sessionMemail"));
		}
		
		return "blog/heartSatatus";
	}
	
	@GetMapping("/addComment")
	public String addComment(int rno, Model model) {
		//service.addComment(rno); // 받은 rno를 가져가서 rno를 first로 하는 댓글을 추가한다. insert문
		
		
		
		return "blog/blogcommentList";
	}
	
	@GetMapping("/boardSearch")
	public String boardSearch(String searchContent, Model model) {
		logger.info("boardSearch 실행");
		List<BoardDto> list = service.searchList(searchContent);
		model.addAttribute("list", list);
		
		return "blog/blogList";
	}
	
}
