package com.mycompany.webapp.dao;


import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.InquiryDto;
import com.mycompany.webapp.dto.ReplyDto;


@Repository
public class InquiryDao {
	
	@Resource
	private SqlSessionTemplate sst;

	public  void inquiryinsert(InquiryDto inquiry) {
		sst.insert("mybatis.mapper.inquiry.inquiryinsert", inquiry);
	}

}
