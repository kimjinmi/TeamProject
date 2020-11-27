package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
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
import com.mycompany.webapp.service.SettingService;

@Controller
@RequestMapping("/setting")
public class SettingController {
	private static final Logger logger = LoggerFactory.getLogger(SettingController.class);
	
	@RequestMapping("/manager")
	public String manager(MemberDto memberdto, HttpSession session, Model model) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		return "manager/content";
	}
	
	@RequestMapping("/content")
	public String content(MemberDto memberdto, HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		logger.info(sessionMemail);
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		return "setting/content";
	}
	
	@RequestMapping("/myneighborlist")
	public String myneighborlist(HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");

		String sessionMemail = (String) session.getAttribute("sessionMemail");
		String SessionMnickname = (String) session.getAttribute("SessionMnickname"); //대소문자조심
		String SessionMurl = (String) session.getAttribute("SessionMurl"); //대소문자조심
		logger.info("memail :"+sessionMemail);
		logger.info("mnickname :"+SessionMnickname);
		logger.info("murl :"+SessionMurl);
		
		return "setting/myneighborlist";
		
	}
	
	
	@RequestMapping("/mybloglist")
	public String mybloglist(HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");

		String sessionMemail = (String) session.getAttribute("sessionMemail");
		List<BoardDto> list = service.getBoardList(sessionMemail);
		model.addAttribute("list", list);
		return "setting/mybloglist";
		
	}
	
	@RequestMapping("/mycommentlist")
	public String mycommentlist(HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		return "setting/mycommentlist";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		return "setting/delete";
	}
	
	@RequestMapping("/passwordchange")
	public String imagechange(HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		return "setting/passwordchange";
	}
	
	@RequestMapping("/setting")
	public String setting(MemberDto memberdto, HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		logger.info(sessionMemail);
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		return "setting/setting";
	}
	
	@RequestMapping("/imagechange")
	public String imagechange(MemberDto memberdto, HttpSession session, Model model) { //http://localhost:8080/teamproject
		logger.info("실행");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		logger.info(sessionMemail);
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		return "setting/imagechange";
	}
	
	
	@Resource
	private SettingService service; 
	
	/*	@RequestMapping("/sessionconnect")
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
		}*/
	
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
	
	@RequestMapping("/photoenroll")
	public String photoenroll(MemberDto member, HttpSession session, Model model) throws Exception, IOException {	
		//memberdto.setMmyimage("winter.PNG");
		//model.addAttribute("member", member);
		logger.info("사진 :"+member.getMmyimage());
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		if(!member.getMphotoAttach().isEmpty()) {
			String originalFileName = member.getMphotoAttach().getOriginalFilename();
			String saveName = new Date().getTime() + "_" + originalFileName;
			logger.info("file name : "+ originalFileName);
			File dest = new File("C:/temp/projectimage/member/" + saveName);
			member.setMemail(sessionMemail);
			member.getMphotoAttach().transferTo(dest);
			member.setMmyimage(saveName);
			service.memberimageupdate(member);
		}else {
			logger.info("사진 :"+member.getMmyimage());
			model.addAttribute("error", "파일이 존재하지 않음");
		}
		return "redirect:/setting/content";
	}
	
	@RequestMapping("/photodelete")
	public String photodelete(MemberDto member, Model model, HttpSession session) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		
		member.setMemail(sessionMemail);
		member.setMmyimage("default.png");
		model.addAttribute("member", member);
		service.memberimageupdate(member);
		return "redirect:/setting/content";
	}
	
	@PostMapping("/updatenickintro")
	public String updatenickintro(MemberDto member){
		
		logger.info(member.getMemail());
		logger.info(member.getMintro());
		logger.info(member.getMnickname());
		service.membernickintroupdate(member);
		return "redirect:/setting/content";
	}
	
	/*@RequestMapping("/doublecheck")
	public String doublecheck(MemberDto member, HttpSession session) {
		
		return "setting/setting";
	}*/
	
	
	

}
