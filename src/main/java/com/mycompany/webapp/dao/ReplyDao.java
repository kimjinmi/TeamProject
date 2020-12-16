package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.PagerDto;
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

	public int countAll() {
		int rows = sst.selectOne("mybatis.mapper.reply.countAll");
		return rows;
	}

	public List<ReplyDto> selectByPage(PagerDto pager) {
		List<ReplyDto> list = sst.selectList("mybatis.mapper.reply.selectByPage", pager);
		return list;
	}

	//진미 : 전체 글의 구하는거임 삭제 ㄴ, 고쳐서 사용 금지
	public List<ReplyDto> selectByAllPage(PagerDto pager) {
		List<ReplyDto> list = sst.selectList("mybatis.mapper.reply.selectListAll", pager);
		return list;
	}

	public int deleteByRno(int rno) {
		int rows = sst.delete("mybatis.mapper.reply.deleteByRno", rno);
		return rows;
		
	}

	public void addComent(int rno) {
		sst.insert("mybatis.mapper.reply.addComent", rno);
		
	}

	public int myReplyCount(String memail) {
		int rows = sst.selectOne("mybatis.mapper.reply.myReplyCount", memail);
		return rows;
	}


	
	

}
