package com.mycompany.webapp.dao;


import java.util.List;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.InquiryDto;
import com.mycompany.webapp.dto.PagerDto;
import com.mycompany.webapp.dto.ReplyDto;


@Repository
public class InquiryDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public  void inquiryinsert(InquiryDto inquiry) {
		sst.insert("mybatis.mapper.inquiry.inquiryinsert", inquiry);
	}

	public int countAll() {
		int rows = sst.selectOne("mybatis.mapper.inquiry.countAll");
		return rows;
	}

	public List<InquiryDto> selectByPageInquiry(PagerDto pager) {
		List<InquiryDto> list = sst.selectList("mybatis.mapper.inquiry.selectByPageInquiry", pager);
		return list;
	}

	public int deleteByIno(int ino) {
		int rows = sst.delete("mybatis.mapper.inquiry.deleteByIno", ino);
		return rows;
		
	}

	public InquiryDto selectByIno(int ino) {
		InquiryDto inquiry = sst.selectOne("mybatis.mapper.inquiry.selectByIno", ino);
		return inquiry;
	}

	public int sendByIno(int ino) {
		int inquiry = sst.update("mybatis.mapper.inquiry.sendByIno", ino);
		return inquiry;
	}



}
