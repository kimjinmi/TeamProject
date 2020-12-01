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
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.ReplyDto;
import com.mycompany.webapp.dto.SearchDto;

@Service
public class ManagerService {
	private static final Logger logger = LoggerFactory.getLogger(ManagerService.class);

	@Resource
	private MemberDao memberdao;
	
	@Resource
	private BoardDao boarddao;

	@Resource
	private ReplyDao replydao;
	
	
	@Resource
	private CategoryDao categorydao;
	
	public MemberDto sessionconnect(MemberDto member) {
		//logger.info("service: "+member.getMemail());
		MemberDto dbmember = memberdao.selectbyMemail(member.getMemail());
		return dbmember;
		
	}
	
	public List<CategoryDto> getcategorylist() {
		List<CategoryDto> list = categorydao.selectAllCount();
		return list;
	}

	public void addCategory(String addCategory) {
		categorydao.insert(addCategory);
		
	}

	public void deleteCategory(int cno) {
		categorydao.delete(cno);
		
	}

	public void editCategory(int cno, String editCategory2) {
		categorydao.update(cno, editCategory2);
		
	}

	public List<MemberDto> getmanagerlist(String role) {
		List<MemberDto> list = memberdao.selectmrole(role);
		return list;
	}

	public void managerChange(MemberDto member) {
		memberdao.updaterole(member);
		
	}

	public int getTotalBoardRows() {
		int totalRows = boarddao.countAll();
		return totalRows;
	}
	
	public int getSearchTotalBoardRows(SearchDto search) {
		int totalRows = boarddao.countSearchAll(search);
		return totalRows;
	}

	public List<BoardDto> getBoardList(PagerDto pager) {
		List<BoardDto> list = boarddao.selectByAllPage(pager);
		return list;
	}

	public void boarddelete(int bno) {
		boarddao.deleteByBno(bno);
		
		
	}

	public int getTotalReplyRows() {
		int totalRows = replydao.countAll();
		return totalRows;
	}
	


	public List<ReplyDto> getReplyList(PagerDto pager) {
		List<ReplyDto> list = replydao.selectByAllPage(pager);
		return list;
	}

	public void replydelete(int rno) {
		replydao.deleteByRno(rno);
		
	}

	public List<BoardDto> getUserBoardList(PagerDto pager) {
		List<BoardDto> list = boarddao.selectByAllPageUser(pager);
		return list;
	}

	



}
