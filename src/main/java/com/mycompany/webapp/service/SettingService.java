package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dao.NeighborDao;
//import com.mycompany.webapp.dao.NeighborDao;
import com.mycompany.webapp.dao.ReplyDao;
import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.NeighborDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.ReplyDto;


@Service
public class SettingService {
	private static final Logger logger = LoggerFactory.getLogger(SettingService.class);

	@Resource
	private MemberDao memberdao;
	
	@Resource
	private BoardDao boarddao;
	
	@Resource
	private ReplyDao replydao;
	
	@Resource
	private CategoryDao categorydao;
	
	@Resource
	private NeighborDao neighbordao;


	public MemberDto sessionconnect(MemberDto member) {
		//logger.info("service: "+member.getMemail());
		MemberDto dbmember = memberdao.selectbyMemail(member.getMemail());
		return dbmember;
		
	}

	public void membernickintroupdate(MemberDto member) {
		
		logger.info("mnickname: " + member.getMnickname());
		logger.info("mintro : " + member.getMintro());
		memberdao.updatenickintro(member);
	}

	public void memberimageupdate(MemberDto member) {
		logger.info("mmyimage :" + member.getMmyimage());
		memberdao.updateimage(member);
		
		
	}

	public List<BoardDto> getBoardList(String sessionMemail) {
		List<BoardDto> list = boarddao.selectAll(sessionMemail);
		return list;
	}

	public int getTotalRows() {
		int totalRows = boarddao.countAll();
		return totalRows;
	}



    public List<BoardDto> getBoardListPage(PagerDto pager) { 
	  
	    List<BoardDto> list = boarddao.selectByPage(pager); 
	    return list; 
    }

	public int getTotalMyRow(String murl) {
		int getTotalMyRow = boarddao.myBoardCount(murl);
		return getTotalMyRow;
	}

	
	public void boardDelete(int bno) {
		int rows = boarddao.deleteByBno(bno);
		
	}

	public List<ReplyDto> getReplyListPage(PagerDto pager) {
		
		List<ReplyDto> list = replydao.selectByPage(pager); 
		return list;
	}


	  
	  
	 


	public List<NeighborDto> myNlist(String mymemail) {
		List<NeighborDto>  list = neighbordao.selectNlistAll(mymemail);
		return list;
	}

	public void deletebloglist(int bno) {
		int rows = boarddao.deletebloglist(bno);
		
	}

						//내 이웃 삭제
	public void nDelete(int nno) {
		int rows = neighbordao.deleteByNno(nno);	
	}
	
						//내 이웃 리스트 페이지 작성 과정1 - 내 이웃의 수 
	public int getTotalMyRownList(String mymemail) {
		int totalMyRows = neighbordao.myNeighborCount(mymemail);
		logger.info(" 2222222222222222totalMyRows : " + totalMyRows);
		
		return totalMyRows;
	}
	
						//내 이웃 리스트 페이지 작성 과정 2 - 페이저
	public List<NeighborDto> getNighborList(PagerDto pager) { 
	    List<NeighborDto> list = neighbordao.selectByPageNeList(pager); 
	    logger.info("444444444444list : " + list);
	    
	    return list; 
    }
	
	//---------------------------------------영아------------------------------------------

}
