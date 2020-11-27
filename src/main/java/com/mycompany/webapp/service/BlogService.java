package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

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
	
	/*public List<CategoryDto> getBoardList() {		//controller에서 호출함
			List<CategoryDto> list = categoryDao.selectAll();			//selectAll을 호출함 - ch14memberDao에서 만들어줌
			return list;
	}*/

	public List<BoardDto> getBoardList(String memail) {										//userurl이 들어옴(memail자리에)
		List<BoardDto> list = boardDao.selectUserBoard(memail);
		return list;
	}
	
	public List<CategoryDto> categoryList() {													//영아
		List<CategoryDto> list = categoryDao.selectAll();
		return list;
	}
	public List<CategoryDto> categoryListMurl(String UserUrl) {													//영아
		List<CategoryDto> list = categoryDao.selectMurl(UserUrl);
		return list;
	}
	
	//영아 - 보드 게시물 / 이메일 & cno 가 맞을 때
	public List<BoardDto> bcno(int cno, String userUrl) {
			List<BoardDto> list = boardDao.categoryListLink(cno, userUrl);
			return list;
		}
	
	//영아 - 나의 블로그 내 좋아요 순 상위 4개 게시물
	public List<BoardDto> BoardList(int blike, String userUrl) {	
		List<BoardDto> list = boardDao.selectBtitleAll(blike, userUrl);
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
	
}
