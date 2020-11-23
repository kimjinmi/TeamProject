package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

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
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.SettingService;

@Controller
@RequestMapping("/setting")
public class SettingController {
	private static final Logger logger = LoggerFactory.getLogger(SettingController.class);

	@RequestMapping("/content")
	public String content() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "setting/content";
	}
	
	@RequestMapping("/setting")
	public String setting(MemberDto memberdto, HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");
		String memail = (String)session.getAttribute("sessionMemail");
		memberdto.setMemail(memail);
		MemberDto member =service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		return "setting/setting";
	}
	
	@RequestMapping("/imagechange")
	public String imagechange(MemberDto memberdto, HttpSession session) { //http://localhost:8080/teamproject
		logger.info("실행");
		String memail = (String)session.getAttribute("sessionMemail");
		memberdto.setMemail(memail);
		MemberDto member =service.sessionconnect(memberdto);
		logger.info(member.getMmyimage());
		return "setting/imagechange";
	}
	
	
	@RequestMapping("/mybloglist")
	public String mybloglist() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "setting/mybloglist";
	}
	
	@RequestMapping("/mycommentlist")
	public String mycommentlist() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "setting/mycommentlist";
	}
	
	@RequestMapping("/delete")
	public String delete() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "setting/delete";
	}
	
	@Resource
	private SettingService service; 
	
	@RequestMapping("/sessionconnect")
	public String sessionconnect(MemberDto memberdto, HttpSession session, Model model) {
		
		memberdto.setMemail("jinmikim88@gmail.com");
		MemberDto member =service.sessionconnect(memberdto);
		
		session.setAttribute("sessionMemail", memberdto.getMemail());
		model.addAttribute("member", member);
		return "setting/content";
	}
	
	@RequestMapping("/sessiondelete")
	public String sessiondelete(HttpSession session) {
		session.invalidate();		
		return "setting/content";
	}
	
	@GetMapping("/photodownload")
	public void photodownload(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info(fileName);
		
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "D:/MyWorkspace/photo/" + fileName;
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
	
	@RequestMapping("/photoenroll")
	public String photoenroll(MemberDto memberdto, Model model) {
		
		memberdto.setMmyimage("spring.PNG");
		model.addAttribute("member", memberdto);
		return "setting/content";
	}
	
	@RequestMapping("/photodelete")
	public String photodelete(MemberDto memberdto, Model model) {
		
		memberdto.setMmyimage("unnamed.jpg");
		model.addAttribute("member", memberdto);
		return "setting/content";
	}

}
