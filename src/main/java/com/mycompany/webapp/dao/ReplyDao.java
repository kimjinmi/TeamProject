package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.ReplyDto;

@Repository
public class ReplyDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public List<ReplyDto> selectBoardComment(int bno) {
		List<ReplyDto> list = sst.selectList("mybatis.mapper.board.selectBoardComment", bno);
		return list;
	}

	public int commentinsert(ReplyDto reply) {
		int rows = sst.insert("mybatis.mapper.board.commentinsert", reply);
		return rows;
	}

	public int countAll(int rno) {
		int rows = sst.selectOne("mybatis.mapper.reply.countAll", rno);
		return rows;
	}
	
	

}
