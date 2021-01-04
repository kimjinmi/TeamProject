package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dao.NeighborDao;
import com.mycompany.webapp.dao.ReplyDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.NeighborDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.ReplyDto;

@Service
public class BlogService {

	@Resource
	private BoardDao boardDao;

	@Resource
	private CategoryDao categoryDao;

	@Resource
	private ReplyDao replyDao;

	@Resource
	private MemberDao memberDao;

	@Resource
	private NeighborDao neighborDao;

	public BoardDto getBoard(int bno) {
		BoardDto board = boardDao.selectByBno(bno);
		return board;
	}

	public List<BoardDto> getBoardList(PagerDto pager) { 
		List<BoardDto> list = boardDao.selectUserBoard(pager);
		return list;
	}

	// 카테고리 리스트
	public List<CategoryDto> categoryList() {
		List<CategoryDto> list = categoryDao.selectAll();
		return list;
	}

	// 내 블로그 내의 카테고리 리스트
	public List<CategoryDto> categoryListMurl(String UserUrl) {
		List<CategoryDto> list = categoryDao.selectMurl(UserUrl);
		return list;
	}

	// 보드 게시물 / 이메일 & cno 가 맞을 때
	public List<BoardDto> bcno(int cno, String userUrl) {
		List<BoardDto> list = boardDao.categoryListLink(cno, userUrl);
		return list;
	}

	// 나의 블로그 내 좋아요 순 상위 4개 게시물 리스트
	public List<BoardDto> bLikeList(String userUrl) {
		List<BoardDto> list = boardDao.selectBLikeList(userUrl);
		return list;
	}

	// 이웃 리스트
	public int neighborlistRows(String memail) {
		int row = neighborDao.myNeighborCount(memail);
		return row;
	}

	public List<NeighborDto> getNeighborList(PagerDto pager) {
		List<NeighborDto> list = neighborDao.selectByPageNeList(pager);
		return list;
	}

	public List<ReplyDto> commentList(int bno) {
		List<ReplyDto> list = replyDao.selectBoardComment(bno);
		return list;
	}

	public MemberDto getMimage(String murl) {
		MemberDto list = memberDao.selectByMurl(murl);
		return list;
	}

	public void commentWrite(ReplyDto reply) {
		replyDao.commentinsert(reply);
	}

	public void boardWrite(BoardDto board) {
		boardDao.insert(board);
	}

	public List<BoardDto> bLikeList1() {
		List<BoardDto> list = boardDao.selectBLikeList1();
		return list;
	}

	public int commentDelete(int rno) {
		int rows = boardDao.commentDelete(rno);
		return rows;
	}

	public void boardDelete(int bno) {
		boardDao.deleteByBno(bno);
	}

	public BoardDto boardLikeCount(int bno) {
		BoardDto list = boardDao.boardLikeCount(bno);
		return list;
	}

	public int getTotalRows(String userUrl) {
		int totalRows = boardDao.userBoardCountAll(userUrl);
		return totalRows;
	}

	public int heartCheck(String SessionMemail, int bno) {
		int row = boardDao.heartCheck(SessionMemail, bno);
		return row;
	}

	// 친구구현
	public int neighorexist(String userUrl, String memail) {
		int existRows = neighborDao.neighorexist(userUrl, memail);
		return existRows;
	}

	// 친구추가
	public void addneighbor(NeighborDto neighbor) {
		neighborDao.insertneighbor(neighbor);
	}

	public void likeadd(int bno) {
		boardDao.likeadd(bno);
	}

	// 게시물 수정 bno 얻기 (선)
	public BoardDto getBoardContentBno(int bno) {
		BoardDto board = boardDao.selectContentBno(bno);
		return board;
	}

	// 게시물 수정 update (선)
	public void boardUpdate(BoardDto board) {
		boardDao.update(board);
	}

	public void likeinfo(int bno, String sessionMemail) {
		boardDao.likeinfo(bno, sessionMemail);
	}

	public void likedsub(int bno) {
		boardDao.likesub(bno);
	}

	public void likeinfoDelete(int bno, String sessionMemail) {
		boardDao.likeinfoDelete(bno, sessionMemail);
	}

	public void addComment(int rno) {
		replyDao.addComent(rno);
	}

	public List<BoardDto> searchList(String searchContent, String murl) {
		List<BoardDto> list = boardDao.searchList(searchContent, murl);
		return list;
	}

	public void commentModify(int rno, String rcontent) {
		boardDao.commentModify(rno, rcontent);
	}
}
