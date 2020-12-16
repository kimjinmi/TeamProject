package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.HomeService;

@Controller
public class HomeController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private HomeService service;
	
	@RequestMapping("/")
	public String content(HttpSession session, Model model, String memail) { //http://localhost:8080/teamproject
		
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		logger.info("sessionMemail");
		if(sessionMemail==null) {
			session.setAttribute("SessionMnickname", "");
			session.setAttribute("SessionMemail", "");
			session.setAttribute("SessionMurl", "");
		}
		if(sessionMemail!=null) {
			MemberDto member = service.selectbyMemail(sessionMemail);
			model.addAttribute("member", member);
			logger.info(member.getMnickname());
			
			session.setAttribute("SessionMnickname", member.getMnickname());
			session.setAttribute("SessionMemail", member.getMemail());
			session.setAttribute("SessionMurl", member.getMurl());
		}
		return "home";
	}
	
	@RequestMapping("/elements")
	public String elements() { //http://localhost:8080/teamproject
	
		return "elements";
	}
	
	@RequestMapping("/sessionconnect")
	public String sessionconnect() { //http://localhost:8080/teamproject
		return "sessionconnect";
	}
	
	@PostMapping("/sessionconnectForm")
	public String sessionconnectForm(HttpServletRequest request, HttpSession session) { //http://localhost:8080/teamproject
		String value = request.getParameter("value");
		logger.info("value :" + value);
		session.setAttribute("sessionMemail", value);
		
		
		// 로그인이 되었을때 작동되어야 할 코드 ** 수정 금지 ** 김지훈 작성 ***********************************************************

		String sessionMemail = (String) session.getAttribute("sessionMemail"); // 로그인하고 로그인했을 경우 로그인 아이디를 세션에 저장
		logger.info("현재 세션의 sessionMemail은 " + sessionMemail); // 됬고
		
		
		MemberDto member = service.getMemberInfo(sessionMemail); // 세션 아이디의 값으로 아이디에 해당하는 유저의 정보를 가져온다.
		logger.info("Member 객체의 값 : "  + member.toString());
		
		String UserUrl = member.getMurl(); // 가져온 정보중 세션 유저의 murl 정보만 획득
		logger.info("######################       member의 Muri = " + member.getMurl());
		session.setAttribute("UserUrl", UserUrl); // 유저의 정보중에서 MURL만 세션에 넣는다.
		/*
		
		// 김지훈 작성 // 수정 금지 *****************************************************************************************
	*/
		return "home";
	}
	
	// 영아 -  home에 보이는 Ranking 순위 
	@RequestMapping("/homeRanking")
	public String homeRanking(Model model) {
		List<BoardDto> bRanking = service.getHomeRanking();
		model.addAttribute("board", bRanking);
		return "homeRanking";
	}
	
	@GetMapping("/boardphotodownload")
	public void boardphotodownload(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/temp/projectimage/board/" + fileName;
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
	
}