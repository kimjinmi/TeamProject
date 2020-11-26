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

	public int updatenickintro(MemberDto member) {
		int rows = sst.update("mybatis.mapper.member.updatenickintro", member);
		return rows;
	}

	public int updateimage(MemberDto member) {
		int rows = sst.update("mybatis.mapper.member.updateimage", member);
		return rows;
	}


	public MemberDto selectbyMimage(String memail) {
		MemberDto dbmimage = sst.selectOne("mybatis.mapper.member.selectByMemail", memail);
		return dbmimage;
	}

	public int countMemail(String memail) {
		int rows = sst.selectOne("mybatis.mapper.member.countMemail", memail);
		return rows;
	}

	public int countMnickname(String mnickname) {
		int rows = sst.selectOne("mybatis.mapper.member.countMnickname", mnickname);
		return rows;
	}

	public int insert(MemberDto member) {
		int row = sst.insert("mybatis.mapper.member.insert", member);
		return row;
		
	}

	

	

	

}
