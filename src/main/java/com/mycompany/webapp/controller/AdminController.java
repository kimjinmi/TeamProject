package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.DisabledDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Resource
	private AdminService service; 

	@RequestMapping("/content")
	public String content(MemberDto memberdto, HttpSession session, Model model) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		List<MemberDto> manager = service.getmanagerlist("ROLE_MANAGER");
		model.addAttribute("manager", manager);
		return "admin/content";
	}
	

	@RequestMapping("/managersetting")
	public String managersetting(Model model) {
		List<MemberDto> manager = service.getmanagerlist("ROLE_MANAGER");
		model.addAttribute("manager", manager);
		return "admin/managersetting";
	}
	
	//----------------------------------------------------------------영아--------------------------------------------------------------------//
	
			//admin - 회원 관리 - abled된 사람들(1)을 찾아서 enabled(0)으로 바꾸기
			
	/*	@RequestMapping("/usersetting")
				public String usersetting(Model model) {
					List<MemberDto> mabled = service.pickedAbledPerson(1);
					model.addAttribute("mabled", mabled);
				return "admin/usersetting";
				}
				*/
	
				//admin - 회원 관리 - abled된 사람들(1)을 찾아서 enabled(0)으로 바꾸기
	@RequestMapping("/usersetting")
	public String usersetting (@RequestParam(defaultValue="1")int pageNo, Model model, HttpSession session) {
		
		int totalRows = service.getTotalMyRownList();
		PagerDto pager = new PagerDto(3, 5, totalRows, pageNo);		
		List<MemberDto> mabled = service.pickedAbledPerson(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("mabled", mabled);
		return "admin/usersetting";
	}
	
				//admin - 차단 회원 관리
	@RequestMapping("/disabledmember")
	public String disabledmember(@RequestParam(defaultValue="1")int pageNo, Model model, HttpSession session) {
		
		int totalRows = service.mdisabledRows();
		PagerDto pager = new PagerDto(3, 5, totalRows, pageNo);
		List<DisabledDto> mdisabled = service.pickedDisabledPerson(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("mdisabled", mdisabled);

	return "admin/disabledmember";
	}
	
	//----------------------------------------------------------------영아--------------------------------------------------------------------//
	
	@GetMapping("/managerDelete")
	public void managerDelete(String memail, HttpServletResponse response, MemberDto member) throws Exception {
		String mrole = "ROLE_USER";
		member.setMemail(memail);
		member.setMrole(mrole);
		logger.info(memail);
		
		service.managerChange(member);
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
	
	
	@GetMapping("/managerAdd")
	public void managerAdd(String memail, HttpServletResponse response, MemberDto member) throws Exception {
		String mrole = "ROLE_MANAGER";
		member.setMemail(memail);
		member.setMrole(mrole);
		logger.info(memail);
		
		service.managerChange(member);
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
	
	
	@GetMapping("/photodownload")
	public void photodownload(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
