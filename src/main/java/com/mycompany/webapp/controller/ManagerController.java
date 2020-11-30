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
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.service.ManagerService;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	@Resource
	private ManagerService service; 
	
	@RequestMapping("/content")
	public String content(MemberDto memberdto, HttpSession session, Model model) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		List<CategoryDto> category = service.getcategorylist(); 
		model.addAttribute("category", category);
		return "manager/content";
	}
	
	@RequestMapping("/categoryadd")
	public String categoryadd(String addCategory) {
		service.addCategory(addCategory);
		return "redirect:/manager/content";
	}
	
	@RequestMapping("/categoryedit")
	public String categoryedit(String editid, String editCategory2) {
		
		int cno = Integer.parseInt(editid);
		service.editCategory(cno, editCategory2);
		return "redirect:/manager/content";
	}
	
	@RequestMapping("/categorydelete")
	public String categorydelete(String deleteid) {
		int cno = Integer.parseInt(deleteid);
		service.deleteCategory(cno);
		return "redirect:/manager/content";
	}
	
	@RequestMapping("/editcategory")
	public String editcategory(Model model) {
		List<CategoryDto> category = service.getcategorylist(); 
		model.addAttribute("category", category);
		return "manager/editcategory";
	}
	
	@RequestMapping("/allboardlist")
	public String allboardlist(Model model) {
		List<CategoryDto> category = service.getcategorylist(); 
		model.addAttribute("category", category);
		return "manager/allboardlist";
	}
	
	@RequestMapping("/allreplylist")
	public String allreplylist(Model model) {
		List<CategoryDto> category = service.getcategorylist(); 
		model.addAttribute("category", category);
		return "manager/allreplylist";
	}
	
	@RequestMapping("/inquirylist")
	public String inquirylist(Model model) {
		List<CategoryDto> category = service.getcategorylist(); 
		model.addAttribute("category", category);
		return "manager/inquirylist";
	}

	@RequestMapping("/managersetting")
	public String managersetting(Model model) {
		List<CategoryDto> category = service.getcategorylist(); 
		model.addAttribute("category", category);
		return "manager/managersetting";
	}
	
	@RequestMapping("/usersetting")
	public String usersetting(Model model) {
		List<CategoryDto> category = service.getcategorylist(); 
		model.addAttribute("category", category);
		return "manager/usersetting";
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
}
