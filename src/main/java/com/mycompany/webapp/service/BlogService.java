package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;

@Service
public class BlogService {
	
	@Resource
	private BoardDao boardDao;

	public BoardDto getBoard(int bno) {
		BoardDto board = boardDao.selectByBno(bno);
		return board;
	}
	
	@Resource
	private CategoryDao categoryDao;
	
	public List<CategoryDto> getBoardList() {		//controller에서 호출함
			List<CategoryDto> list = categoryDao.selectAll();			//selectAll을 호출함 - ch14memberDao에서 만들어줌
			return list;
	}

}
