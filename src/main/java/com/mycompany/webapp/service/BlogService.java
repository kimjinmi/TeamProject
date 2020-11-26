package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dao.ReplyDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.ReplyDto;

@Service
public class BlogService {
	private static final Logger logger = LoggerFactory.getLogger(BlogService.class);
	@Resource
	private BoardDao boardDao;
	
	@Resource
	private CategoryDao categoryDao;
	
	@Resource
	private ReplyDao replyDao;
	
	@Resource
	private MemberDao updateimageDao;
	@Resource
	private MemberDao memberDao;
	

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
	
	public List<BoardDto> BoardList() {
		List<BoardDto> list = boardDao.selectBtitleAll();
		return list;
	}

	public List<ReplyDto> commentList(int bno){
		List<ReplyDto> list = replyDao.selectBoardComment(bno);
		return list;
	}

	public MemberDto getMimage(String memail) {
		MemberDto list = memberDao.selectbyMemail(memail);
		return list;
	}

	public void commentWrite(ReplyDto reply) {
		replyDao.commentinsert(reply);
		logger.info("새로 입력된 Rno : " + reply.getRno());
	}

	public void boardWrite(BoardDto board) {
		boardDao.insert(board);
	}
	
}
