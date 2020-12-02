package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.LikedDto;
import com.mycompany.webapp.dto.PagerDto;

@Repository
public class LikedDao {

	@Resource
	private SqlSessionTemplate sst;

	public int myLikedCount(String sessionMemail) {
		int totalRows = sst.selectOne("mybatis.mapper.liked.countmyliked", sessionMemail);
		return totalRows;
	
	}

	public List<LikedDto> mylikelist(PagerDto pager) {
		List<LikedDto> list = sst.selectList("mybatis.mapper.liked.selectmylikelist",pager);
		return list;
	}
	
	
}
