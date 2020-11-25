package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.PagerDto;

@Service
public class ContentsService {
	
	@Resource
	private BoardDao boardDao;

	public List<BoardDto> getBoardList() {
		List<BoardDto> list = boardDao.selectNewAll();
		return list;
	}
	

	public List<BoardDto> getBoardListCno(int cno) {
		List<BoardDto> list = boardDao.selectNewCategory(cno);
		return list;
	}

	@Resource
	private CategoryDao categoryDao;
	
	public List<CategoryDto> getCategoryList() {
		List<CategoryDto> list = categoryDao.selectAll();
		return list;
	}


	public BoardDto getBoard(int bno) {
		BoardDto board = boardDao.selectByBno(bno);
		return board;
	}


}
