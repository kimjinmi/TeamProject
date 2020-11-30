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
import com.mycompany.webapp.dto.CategoryDto;
import com.mycompany.webapp.dto.MemberDto;

@Service
public class ManagerService {
	private static final Logger logger = LoggerFactory.getLogger(ManagerService.class);

	@Resource
	private MemberDao memberdao;
	
	@Resource
	private BoardDao boarddao;

	
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
		List<MemberDto> list = memberdao.selectmanager(role);
		return list;
	}

	public void managerDelete(MemberDto member) {
		memberdao.updaterole(member);
		
	}



}
