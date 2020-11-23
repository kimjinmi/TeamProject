package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.PagerDto;

@Service
public class ContentsService {
	
	@Resource
	private BoardDao boardDao;

	public List<BoardDto> getBoardList() {
		List<BoardDto> list = boardDao.selectAll();
		return list;
	}
	
}
