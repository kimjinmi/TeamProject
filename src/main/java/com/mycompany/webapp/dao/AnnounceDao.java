package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.AnnounceDto;
import com.mycompany.webapp.dto.LikedDto;
import com.mycompany.webapp.dto.PagerDto;

@Repository
public class AnnounceDao {

	@Resource
	private SqlSessionTemplate sst;

	public int insertannounce(AnnounceDto announcedto) {
		int row = sst.insert("mybatis.mapper.announce.insertannounce", announcedto);
		return row;
	}

	
	
	
}
