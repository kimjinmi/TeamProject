package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.PagerDto;

@Repository
public class BoardDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public BoardDto selectByBno(int bno) {
		BoardDto board = sst.selectOne("mybatis.mapper.board.selectByBno", bno);
		return board;
	}
	
	public List<BoardDto> selectAll() {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectAll");
		return list;
	}
	
	public List<BoardDto> selectCategory(int cno) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectCategory", cno);
		return list;
	}

	public List<BoardDto> selectUserBoard(String memail) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectUserBoard", memail);
		return list;
	}
	
	public List<BoardDto> selectByPage(PagerDto pager) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectByPage", pager);
		return list;
	}



}
