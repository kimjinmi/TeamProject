package com.mycompany.webapp.controller;

import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {
	
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
	
	@GetMapping("/boardView")
	public String boardView(int bno, Model model) {
		BoardDto board = service.getBoard(bno);
		return "blog/blog_details";
	}
	
	@RequestMapping("/blog")
	public String blog() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog/blog";
	}
	
	@RequestMapping("/blog_write")
	public String blog_write() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog/blog_write";
	}
	
	@RequestMapping("/blog_details")
	public String blog_details() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "blog/blog_details";
	}
	
	
	
}
