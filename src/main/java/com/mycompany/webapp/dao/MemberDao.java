package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.MemberDto;

@Repository
public class MemberDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public MemberDto selectbyMemail(String memail) {
		MemberDto dbmember = sst.selectOne("mybatis.mapper.member.selectByMemail", memail);
		return dbmember;
	}


}
