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
		logger.info("#######" + sessionMemail);
		List<BoardDto> list = boarddao.selectAll(sessionMemail);
		return list;
	}

	public int getTotalRows() {
		int totalRows = boarddao.countAll();
		return totalRows;
	}
	//댓글 총 갯수 불러오기

	
	  public List<BoardDto> getBoardListPage(PagerDto pager) { 
		  
		  List<BoardDto> list = boarddao.selectByPage(pager); 
		  return list; 
	  }

	public int getTotalMyRow(String murl) {
		int getTotalMyRow = boarddao.myBoardCount(murl);
		return getTotalMyRow;
	}

	public List<NeighborDto> myNlist(String mymemail) {
		List<NeighborDto>  list = neighbordao.selectNlistAll(mymemail);
		return list;
	}

}
