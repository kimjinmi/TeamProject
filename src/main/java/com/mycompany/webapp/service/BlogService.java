package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dao.ReplyDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.ReplyDto;

@Service
public class BlogService {
	
	@Resource
	private BoardDao boardDao;
	
	@Resource
	private CategoryDao categoryDao;
	
	@Resource
	private ReplyDao replyDao;


	public BoardDto getBoard(int bno) {
		BoardDto board = boardDao.selectByBno(bno);
		return board;
	}
	

	
	public List<CategoryDto> getBoardList() {		//controller에서 호출함
			List<CategoryDto> list = categoryDao.selectAll();			//selectAll을 호출함 - ch14memberDao에서 만들어줌
			return list;
	}

	public List<BoardDto> getBoardList(String memail) {
		List<BoardDto> list = boardDao.selectUserBoard(memail);
		return list;
	}
	
	public List<CategoryDto> categoryList(){
		List<CategoryDto> list = categoryDao.selectAll();
		return list;
	}
	
	public List<ReplyDto> commentList(int bno){
		List<ReplyDto> list = replyDao.selectBoardComment(bno);
		return list;
	}
}
