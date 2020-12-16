package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.AnnounceDto;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.InquiryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.ReplyDto;
import com.mycompany.webapp.dto.SearchDto;
import com.mycompany.webapp.service.ManagerService;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	@Resource
	private ManagerService service; 
	
	@RequestMapping("/admin")
	public String admin(MemberDto memberdto, HttpSession session, Model model) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		return "redirect:/admin/content";
	}
	
	@RequestMapping("/content")
	public String content(MemberDto memberdto, HttpSession session, Model model) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		
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
	public String allboardlist(Model model, @RequestParam(defaultValue = "1")int pageNo) {
		int totalRows = service.getTotalBoardRows();
		PagerDto pager = new PagerDto(8, 5, totalRows, pageNo);
		List<BoardDto> list = service.getBoardList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "manager/allboardlist";
	}

	@RequestMapping("/searchboard")
	public String searchboard(Model model, SearchDto searchdto, @RequestParam(defaultValue = "1")int pageNo) {
		String value = searchdto.getValue();
		String search = searchdto.getSearch();
		int totalRows = service.getSearchTotalBoardRows(searchdto);
		String searchvalue = null;
		if(value.equals("btitle")) {
			searchvalue="title";
		}else if(value.equals("bcontent")) {
			searchvalue="content";
		}else if(value.equals("b.memail")) {
			searchvalue="blogwriter";
		}else if(value.equals("ccontent")) {
			searchvalue="category";
		}
		
		PagerDto pager = new PagerDto(value, search, 5, 5, totalRows, pageNo);
		List<BoardDto> list = service.getUserBoardList(pager);
		model.addAttribute("totalRows", totalRows);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("searchdto", searchdto);
		model.addAttribute("searchvalue", searchvalue);
		return "manager/searchboardlist";
	}
	
	@RequestMapping("/allreplylist")
	public String allreplylist(Model model, @RequestParam(defaultValue = "1")int pageNo) {
		int totalRows = service.getTotalReplyRows();
		PagerDto pager = new PagerDto(8, 5, totalRows, pageNo);
		List<ReplyDto> list = service.getReplyList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "manager/allreplylist";
	}
	

	@RequestMapping("/inquirylist")
	public String inquirylist() {
		
		return "manager/inquirylist";
	}
	
	@RequestMapping("/inquirybeforecomplete")
	public String inquirybeforecomplete(Model model, @RequestParam(defaultValue = "1")int pageNo) {
		int totalRows = service.getBeforeInquiryRows();

		PagerDto pager = new PagerDto(8, 5, totalRows, pageNo);
		List<InquiryDto> inquiryList = service.getInquiryList(pager);
		//List<CategoryDto> category = service.getcategorylist(); 
		//model.addAttribute("category", category);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("pager", pager);
		return "manager/inquirybeforecomplete";
	}
	
	@RequestMapping("/inquiryaftercomplete")
	public String inquiryaftercomplete(Model model, @RequestParam(defaultValue = "1")int pageNo) {
		int totalRows = service.getAfterInquiryRows();

		PagerDto pager = new PagerDto(8, 5, totalRows, pageNo);
		List<InquiryDto> inquiryList = service.getInquiryList(pager);
		//List<CategoryDto> category = service.getcategorylist(); 
		//model.addAttribute("category", category);
		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("pager", pager);
		return "manager/inquiryaftercomplete";
	}
	
	@RequestMapping("/inquirydelete")
	public void inquirydelete(int ino, HttpServletResponse response) throws Exception {
		service.inquirydelete(ino);
		logger.info("######## "+ ino);
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
	
	@RequestMapping("/inquirydetail")
	public String inquirydetail(int ino, Model model) {
		
		InquiryDto inquiryList = service.getInquiry(ino);
		model.addAttribute("inquiryList", inquiryList);
		
		return "manager/inquirydetail";
	}
	
	@RequestMapping("/inquirysend")
	public void inquirysend(int ino, Model model, HttpServletResponse response) throws Exception {
		
		int inquiryList = service.sendInquiry(ino);
		//model.addAttribute("inquiryList", inquiryList);
		//JSON 생성 
		JSONObject jsonObject = new JSONObject();
		//배열[]로 만들어지면 JSONArray
		jsonObject.put("result", "success");
		
		String json = jsonObject.toString(); // {"result" : "success"}
		
		//응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
/*	@RequestMapping("/inquirycomplete")
	public String inquirycomplete(Model model) {
		
		InquiryDto inquirycomplete = service.getCompleteInquiry();
		model.addAttribute("inquirycomplete", inquirycomplete);
		
		return "manager/inquirylist";
	} */

	
	@RequestMapping("/boarddelete")
	public void boarddelete(int bno, HttpServletResponse response) throws Exception { 
		logger.info("##bno:"+bno);
		service.boarddelete(bno);
		//JSON 생성 
		JSONObject jsonObject = new JSONObject();
		//배열[]로 만들어지면 JSONArray
		jsonObject.put("result", "success");
		
		jsonObject.put("result", "change");
		String json = jsonObject.toString(); // {"result" : "success"}
		
		//응답보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/replydelete")
	public void replydelete(int rno, HttpServletResponse response) throws Exception { 
		
		service.replydelete(rno);
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
	
	/*@GetMapping("/announcewrite")
	public String announcewrite(Model model, HttpSession session) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		return "manager/announcewrite";
	}*/
	
	
	
	/*@RequestMapping("/upload")
	public void upload(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		if(!upload.isEmpty()) {
			String originalFileName = upload.getOriginalFilename();
			originalFileName += new Date().getTime() + "-" + originalFileName;
			//File saveFile = new File("D:/MyWorkspace/photo/board/" + originalFileName);
			File saveFile = new File("C:/temp/projectimage/announceContent/" + originalFileName);
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
	}*/
	
	
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
