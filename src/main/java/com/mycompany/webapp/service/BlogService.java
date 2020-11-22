package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dto.BoardDto;

@Service
public class BlogService {
	
	@Resource
	private BoardDao boardDao;

	public BoardDto getBoard(int bno) {
		BoardDto board = boardDao.selectByBno(bno);
		return board;
	}

	public List<BoardDto> getBoardList(String memail) {
		List<BoardDto> list = boardDao.selectUserBoard(memail);
		return list;
	}
}
