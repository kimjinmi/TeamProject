package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.MemberDto;
import com.mycompany.webapp.dto.PagerDto;


@Repository
public class MemberDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public MemberDto selectByMurl(String murl) { //유저 url이 들어온다
		MemberDto Sessionmurl = sst.selectOne("mybatis.mapper.member.selectByMurl", murl);
		return Sessionmurl;
	}
	
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

	public List<MemberDto> selectmrole(String role) {
		List<MemberDto> list = sst.selectList("mybatis.mapper.member.selectmrole", role);
		return list;
	}

	public int updaterole(MemberDto member) {
		int rows = sst.update("mybatis.mapper.member.updaterole", member);
		return rows;
	}

	//------------------------------------------영아 - 시작----------------------------------------------
	
			//페이저 행의 수(활성화 회원들)
	public int menabledThing() {
		int totalRows = sst.selectOne("mybatis.mapper.member.menabledThing");
		return totalRows;
	}
			
			//활성화 회원들 페이지 만들기
	public List<MemberDto> selectenabled(PagerDto pager) {
		List<MemberDto> list = sst.selectList("mybatis.mapper.member.selectPageList",pager);
		return list;
	}

	public void fromOneToZero(String memail) {
		int rows = sst.update("mybatis.mapper.member.changeToAbled", memail);
		
	}

	public void fromZeroToOne(String memail) {
		int rows = sst.update("mybatis.mapper.member.changeToDisabled", memail);		
	}

	public MemberDto getMemberInfo(String sessionMemail) {
		MemberDto info = sst.selectOne("mybatis.mapper.member.getMemberInfo", sessionMemail);
		return info;
	}

	public void userDelete(String sessionMemail) {
		sst.delete("mybatis.mapper.member.userDelete", sessionMemail);
		}
		
	public MemberDto selectByMphonenum(String mphonenum) {
		MemberDto member = sst.selectOne("mybatis.mapper.member.selectByMphonenum", mphonenum);
		return member;
	}

	public int findmpassword(MemberDto member) {
		int row = sst.selectOne("mybatis.mapper.member.findmpassword", member);
		return row;
	}
	public int updatePassword(MemberDto member) {
		int row = sst.update("mybatis.mapper.member.updatePassword", member);
		return row;
	}

	//------------------------------------------영아 - 끝----------------------------------------------
}
