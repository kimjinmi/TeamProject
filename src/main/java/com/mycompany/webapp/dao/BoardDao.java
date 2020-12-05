package com.mycompany.webapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.SearchDto;

@Repository
public class BoardDao {
	
	@Resource
	private SqlSessionTemplate sst;
	
	public BoardDto selectByBno(int bno) {
		BoardDto board = sst.selectOne("mybatis.mapper.board.selectByBno",bno);
		String str = board.getBlinkcontent();
		if(str.contains("http")) {
			String[] cut = str.split("//");
			board.setBlinkcontent(cut[1]);
		}
		return board;
	}
	
	
	//-------------------------------------------------영아---------------------------------------------------//
	
	//영아 - 보드/카테고리리스트/cno순으로 내 게시물 다 불러오기
	public List<BoardDto> categoryListLink(int cno, String murl) {
		Map map = new HashMap();
		map.put("cno", cno);
		map.put("murl", murl);
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.categoryListLink", map);	
			return list;
	}
	
	//영아 - 나의 블로그 내 좋아요 순 상위 4개 게시물 리스트
	public List<BoardDto> selectBLikeList(String murl) {				//selectAll : Service가 호출함
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectBLikeList", murl);		//like받은 것을 찾아서 모두를 실행해라
		return list;
	}
		
	//-------------------------------------------------영아---------------------------------------------------//
	
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
	
	
	/* 지훈 사용자 블로그리스트 출력하기*/
	/*
	 * public List<BoardDto> selectUserBoard(PagerDto pager) { List<BoardDto> list =
	 * sst.selectList("mybatis.mapper.board.selectUserBoard", pager); return list; }
	 */
	
	public List<BoardDto> selectUserBoard(PagerDto pager) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectUserBoard", pager);
		return list;
	}

	/* 지훈 */
	public List<BoardDto> selectBtitleAll() {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectBtitleAll");
		return list;
	}
	

	//선명 보드 페이저
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

	public int myBoardCount(String murl) {
		int rows = sst.selectOne("mybatis.mapper.board.myBoardCount", murl);
		return rows;
	}

	public int insert(BoardDto board) {
		int rows = sst.insert("mybatis.mapper.board.insert", board);
		return rows;
	}


	public int deleteByBno(int bno) {
		int rows = sst.delete("mybatis.mapper.board.deleteByBno", bno);
		return rows;
	}

	public List<BoardDto> selectBLikeList1() {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectBLikeList1");		//like받은 것을 찾아서 모두를 실행해라
		return list;
	}

	public int commentDelete(int rno) {
		int rows = sst.delete("mybatis.mapper.board.commentDelete", rno);
		return rows;
	}

	
// 선명 : 임시 게시물별로 삭제
	public int deleteBlog(BoardDto board) {
		int rows = sst.delete("mybatis.mapper.board.deleteBlog", board);
		return rows;
	}

	public BoardDto boardLikeCount(int bno) {
		BoardDto list = sst.selectOne("mybatis.mapper.board.boardLikeCount", bno);
		return list;
	}

	public int userBoardCountAll(String userUrl) {
		int totalRows = sst.selectOne("mybatis.mapper.board.userBoardCountAll", userUrl);
		return totalRows;
	}

	//진미 : 전체 글의 구하는거임 삭제 ㄴ, 고쳐서 사용 금지
	public List<BoardDto> selectByAllPage(PagerDto pager) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.selectListAll", pager);
		return list;
	}

	// ------ 선 - 게시물 수정 ------
	public BoardDto selectContentBno(int bno) {
		BoardDto board = sst.selectOne("mybatis.mapper.board.selectContentBno", bno);
		return board;
	}
	
	public int update(BoardDto board) {
		int rows;
		if(board.getBimage() != null) {
			rows = sst.update("mybatis.mapper.board.update", board);
		} else {
			rows = sst.update("mybatis.mapper.board.updateNoImage", board);
		}
		return rows;
	}
	// ------ 선 - 게시물 수정 ------


	public int heartCheck(String SessionMemail, int bno) {
		Map map = new HashMap();
		map.put("SessionMemail", SessionMemail);
		map.put("bno", bno);	
		int row  = sst.selectOne("mybatis.mapper.board.heartCheck", map);
		return row;
	}

	public void likeadd(int bno) {
		sst.update("mybatis.mapper.board.likeadd", bno);
	}


	public void likeinfo(int bno, String sessionMemail) {
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("sessionMemail", sessionMemail);
		sst.insert("mybatis.mapper.board.likeinfo", map);
	}

	public void likesub(int bno) {
		sst.update("mybatis.mapper.board.likesub", bno);	
	}

	public void likeinfoDelete(int bno, String sessionMemail) {
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("sessionMemail", sessionMemail);
		sst.delete("mybatis.mapper.board.likeinfoDelete", map);
	}

	public int countSearchAll(SearchDto search) {
		int row = sst.selectOne("mybatis.mapper.board.userBoardSearchCount", search);
		return row;
	}

	public List<BoardDto> searchList(String searchContent, String murl) {
		Map map = new HashMap();
		map.put("searchContent", searchContent);
		map.put("murl", murl);
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.searchList", map);
		return list;
	}

	public List<BoardDto> selectByAllPageUser(PagerDto pager) {
		List<BoardDto> list = sst.selectList("mybatis.mapper.board.searchListUser", pager);
		return list;
	}


	public void commentModify(int rno, String rcontent) {
		Map map = new HashMap();
		map.put("rno", rno);
		map.put("rcontent", rcontent);
		sst.update("mybatis.mapper.board.commentModify", map);
		
	} 
}
