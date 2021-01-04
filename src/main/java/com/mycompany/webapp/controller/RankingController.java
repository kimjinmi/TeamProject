package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.service.RankingService;

@Controller
@RequestMapping("/ranking")
public class RankingController {
	private static final Logger logger = LoggerFactory.getLogger(RankingController.class);
	
	@Resource private RankingService service;
	
	@GetMapping("/ranking")
		public String boardList(Model model) {
			List<BoardDto> list = service.getBoardList(); 
			List<CategoryDto> category_list = service.getCategoryList(); 
			model.addAttribute("list", list); 
			model.addAttribute("category_list", category_list);
			return "ranking/ranking"; 
	}
	
	@GetMapping("/boardList")
	public String life(int cno, Model model) {
		List<BoardDto> list = service.getBoardListCno(cno); 
		model.addAttribute("list", list); 
		return "ranking/boardList";
	}
	
	@GetMapping("/photodownload_board")
	public void photodownload_board(String fileName, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		String saveFilePath = "C:/temp/projectimage/board/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
	
		String fileType = request.getServletContext().getMimeType(fileName);
		response.setContentType(fileType);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		int fileSize = (int) new File(saveFilePath).length(); // 파일 사이즈 얻기
		response.setContentLength(fileSize);
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}
	
	@GetMapping("/photodownload_member")
	public void photodownload_member(String fileName, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		String saveFilePath = "C:/temp/projectimage/member/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		
		String fileType = request.getServletContext().getMimeType(fileName);
		response.setContentType(fileType);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		int fileSize = (int) new File(saveFilePath).length(); // 파일 사이즈 얻기
		response.setContentLength(fileSize);
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}

	@GetMapping("./blog/blog_details")
	public String board_details(Model model, HttpServletRequest request) {
		 int bno = Integer.parseInt(request.getParameter("bno"));
		 BoardDto board = service.getBoard(bno);
		 model.addAttribute("board", board);
		return "blog/blog_details";
	} 
}
