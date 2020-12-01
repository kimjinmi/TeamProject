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

@Service
public class AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminService.class);

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
	
	
	public List<MemberDto> getmanagerlist(String role) {
		List<MemberDto> list = memberdao.selectmrole(role);
		return list;
	}

	public void managerChange(MemberDto member) {
		memberdao.updaterole(member);
		
	}

	//-------------------------------------영아---------------------------------------
	
			// 이메일을 지정해서 한 사람을 선택하고 활성화(1) 되있던 것을 비활성화(0)으로 바꿈

	public int getTotalMyRownList() {
		int totalMyRows = memberdao.menabledThing();
		return totalMyRows;
	}
	
	public List<MemberDto> pickedAbledPerson(PagerDto pager) {
		List<MemberDto> list = memberdao.selectenabled(pager);
		return list;
	}
	
}
