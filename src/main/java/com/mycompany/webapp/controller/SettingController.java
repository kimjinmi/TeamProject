package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.LikedDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.NeighborDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.ReplyDto;
import com.mycompany.webapp.service.SettingService;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@Resource
	private SettingService service;

	private static final Logger logger = LoggerFactory.getLogger(SettingController.class);

	@RequestMapping("/manager")
	public String manager(MemberDto memberdto, HttpSession session, Model model) {
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		return "redirect:/manager/content";
	}

	@RequestMapping("/content")
	public String content(MemberDto memberdto, HttpSession session, Model model) { //http://localhost:8080/teamproject
		
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		
		memberdto.setMemail(sessionMemail);
		MemberDto member = service.sessionconnect(memberdto);
		model.addAttribute("member", member);
		return "setting/content";
	}

	//---------------------------------------영아, 이웃 관리 시작------------------------------------------

				//이웃 삭제
	@PostMapping("/nDelete") //void - jsp로 이동하지 않겠다
	public void nDelete(int nno, HttpServletResponse response) throws Exception { //아래 response.getWriter();에서 runtimeexception이 생기므로 예외처리해줌

		//서비스를 이용해서 게시물 쓰기
		service.nDelete(nno);

		//JSON 생성
		JSONObject jsonObject = new JSONObject(); //결과가 {} 면 JSONObject / 결과가 배열 - [] 면 JSONArray
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); //{"result","success"}

		//응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8"); //json 응답 만드는것
		out.println(json);
		out.flush();
		out.close();
	}

				//이웃 리스트 페이지
	@GetMapping("/myneighborlist")
	public String myneighborlist(@RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) { 
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		String SessionMurl = (String) session.getAttribute("SessionMurl");
		//페이징
		int totalRows = service.getTotalMyRownList(sessionMemail);
		PagerDto pager = new PagerDto(sessionMemail, 3, 5, totalRows, pageNo);
		List<NeighborDto> list = service.getNighborList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		return "setting/myneighborlist";
	}
	
	// 선명- 게시글 관리

	//---------------------------------------영아, 이웃 관리 끝------------------------------------------

	//게시글 관리
	@RequestMapping("/mybloglist")
	public String mybloglist(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) { //http://localhost:8080/teamproject
		//logger.info("실행");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		String SessionMurl = (String) session.getAttribute("SessionMurl");
		
		//페이징
		int totalRows = service.getTotalMyRow(SessionMurl); //
		
		PagerDto pager = new PagerDto(SessionMurl, 5, 5, totalRows, pageNo);
		
		List<BoardDto> blogList = service.getBoardListPage(pager);
		//List<BoardDto> list = service.getBoardList(sessionMemail);
		
		model.addAttribute("pager", pager);
		model.addAttribute("blogList", blogList);
		
		return "setting/mybloglist";
	}
	

	/*선명- 게시물 관리 리스트 전체,개별삭제 */
	@RequestMapping("/deleteBlog")
	public void deleteBlog(@RequestParam(value="chbox[]")List<String> chbox,  HttpSession session, HttpServletResponse response, BoardDto board) throws Exception {
		
		logger.info("chbox.length======>"+ chbox.size());
		
		
//		List<String> chbox = (List<String>) request.getParameter("chbox"); 
		String murl = (String) session.getAttribute("SessionMurl");
		int bno = 0;
		
		for(String i : chbox) {
			logger.info("chbox.value======>"+i);
			bno = Integer.parseInt(i);
			service.boardDelete(bno);
		}
		//JSON 생성
		JSONObject jsonObject = new JSONObject(); //결과가 {} 면 JSONObject / 결과가 배열 - [] 면 JSONArray
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); //{"result","success"}

		//응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8"); //json 응답 만드는것
		out.println(json);
		out.flush();
		out.close();
	}

	/*선명 - 댓글 관리*/
	@RequestMapping("/mycommentlist")
	public String mycommentlist(@RequestParam(defaultValue="1") int pageNo, HttpSession session, Model model) { //http://localhost:8080/teamproject
		
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		String SessionMurl = (String) session.getAttribute("SessionMurl");
		
		//페이징
		int totalRows = service.getTotalReplyRows(SessionMurl); //
		PagerDto pager = new PagerDto(SessionMurl, 5, 5, totalRows, pageNo);
		List<ReplyDto> replyList = service.getReplyListPage(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("replyList", replyList);
		
	
		return "setting/mycommentlist";
	}
	
	/*선명 - 댓글 관리 리스트 전체,개별삭제 */
	@RequestMapping("/deleteReply")
	public void deleteReply(@RequestParam(value="chbox[]")List<String> chbox, HttpSession session, HttpServletResponse response, ReplyDto reply) throws Exception {
		
		logger.info("chbox.length======>"+ chbox.size());
		String murl = (String) session.getAttribute("SessionMurl");
		int rno = 0;
		
		for(String i : chbox) {
			logger.info("chbox.value======>"+i);
			rno = Integer.parseInt(i);
			service.replyDelete(rno);
		}
		//JSON 생성
		JSONObject jsonObject = new JSONObject(); //결과가 {} 면 JSONObject / 결과가 배열 - [] 면 JSONArray
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); //{"result","success"}

		//응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json;charset=utf-8"); //json 응답 만드는것
		out.println(json);
		out.flush();
		out.close();
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
	public String updatenickintro(MemberDto member, HttpSession session){
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		member.setMemail(sessionMemail);
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
	
	@RequestMapping("/mylikelist")
	public String mylikelist(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) { //http://localhost:8080/teamproject
		//logger.info("실행");
		String sessionMemail = (String) session.getAttribute("sessionMemail");
		int totalRows = service.getTotalMyLikeRow(sessionMemail); //
		PagerDto pager = new PagerDto(sessionMemail, 5, 5, totalRows, pageNo);
		Date time = new Date();
		
		List<LikedDto> list = service.getLikedListPage(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", list);
		
		return "setting/mylikelist";
	}

}
