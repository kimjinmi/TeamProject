package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.PagerDto;

@Repository
public class BoardDao {
	
	@Resource
	private SqlSessionTemplate sst;
	
	public BoardDto selectByBno(int bno) {
		BoardDto board = sst.selectOne("mybatis.mapper.board.selectByBno",bno);
		return board;
	}
	
	/*------------------------- 선 -------------------------*/
	public List<BoardDto> selectLikeAll() {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectLikeAll");
		return list;
	}
	
	public List<BoardDto> selectLikeCategory(int cno) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectLikeCategory", cno);
		return list;
	}

	public List<BoardDto> selectNewAll() {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectNewAll");
		return list;
	}
	
	public List<BoardDto> selectNewCategory(int cno) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectNewCategory", cno);
		return list;
	}	
	
	
	/*------------------------- 선 -------------------------*/
	
	
	public List<BoardDto> selectUserBoard(String memail) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectUserBoard", memail);
		return list;
	}
	
	public List<BoardDto> selectBtitleAll() {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectBtitleAll");
		return list;
	}
	//------------------------------선-------------명--------------

	
	 public List<BoardDto> selectByPage(PagerDto pager) { 
		 List<BoardDto> listpage = sst.selectList("mybatis.mapper.board.selectByPage", pager);
		 
		 return listpage; 
	 }
	

	public List<BoardDto> selectAll(String sessionMemail) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectAll", sessionMemail);
		return list;
	}

	public int countAll() {
		int rows = sst.selectOne("mybatis.mapper.board.countAll");
		return rows;
	}

	public int myBoardCount(String memail) {
		int rows = sst.selectOne("mybatis.mapper.board.myBoardCount", memail);
		return rows;
	}

	
}
