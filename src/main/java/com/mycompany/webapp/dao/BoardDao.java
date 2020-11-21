package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.BoardDto;

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



}
