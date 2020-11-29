package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.NeighborDto;

@Repository
public class NeighborDao {

	@Resource
	private SqlSessionTemplate sst;
	
	public List<NeighborDto> selectNlistAll(String mymemail) {
		 List<NeighborDto> list = sst.selectList("mybatis.mapper.neighbor.selectNlistAll", mymemail);
		 return list;
	}
	
}
