package com.mycompany.webapp.dao;


import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class InquiryDao {
	
	@Resource
	private SqlSessionTemplate sst;

	
	

}