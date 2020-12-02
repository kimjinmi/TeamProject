package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.controller.AdminController;
import com.mycompany.webapp.dto.DisabledDto;
import com.mycompany.webapp.dto.PagerDto;

@Repository
public class DisabledDao {
	private static final Logger logger = LoggerFactory.getLogger(DisabledDao.class);
	@Resource
	private SqlSessionTemplate sst;

	//------------------------------------------영아 - 시작----------------------------------------------

					//페이저 행의 수(비활성화 회원들)
	public int mdisabledThing() {
		int totalRows = sst.selectOne("mybatis.mapper.disabled.mdisabledThing");
		return totalRows;
	}

					//활성화 회원들 페이지 만들기
	public List<DisabledDto> DisabledPageList(PagerDto pager) {
		List<DisabledDto> list = sst.selectList("mybatis.mapper.disabled.DisabledPageList", pager);
		return list;
	}

	//------------------------------------------영아 - 끝----------------------------------------------

}
