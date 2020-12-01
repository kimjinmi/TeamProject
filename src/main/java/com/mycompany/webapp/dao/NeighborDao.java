package com.mycompany.webapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mycompany.webapp.dto.BoardDto;
import com.mycompany.webapp.dto.NeighborDto;
import com.mycompany.webapp.dto.PagerDto;

@Repository
public class NeighborDao {

	@Resource
	private SqlSessionTemplate sst;
	
	//-------------------------------------------------영아---------------------------------------------------//
	
	
				//내 이웃 리스트
	public List<NeighborDto> selectNlistAll(String mymemail) {
		 List<NeighborDto> list = sst.selectList("mybatis.mapper.neighbor.selectNlistAll", mymemail);
		 return list;
	}

	
				//내 이웃 삭제
	public int deleteByNno(int nno) {
		int rows = sst.delete("mybatis.mapper.neighbor.deleteByNno", nno);	
		return rows;
	}
	
				//내 이웃 리스트 페이지 작성 과정1 - 내 이웃의 수 
	public int myNeighborCount(String mymemail) {
		int totalRows = sst.selectOne("mybatis.mapper.neighbor.myNeighborCount", mymemail);
		return totalRows;
	}
	
				//내 이웃 리스트 페이지 작성 과정 2 - 페이저
	public List<NeighborDto> selectByPageNeList(PagerDto pager) {
		List<NeighborDto> list = sst.selectList("mybatis.mapper.neighbor.selectByPageNeList", pager);
		return list;
	}

	//-------------------------------------------------영아---------------------------------------------------//
	
	//진미
	public int neighorexist(String userUrl, String memail) {
		Map map = new HashMap();
		map.put("userUrl", userUrl);
		map.put("memail", memail);
		int existRows = sst.selectOne("mybatis.mapper.neighbor.neighorexistCount", map);
		return existRows;
	}


	public int insertneighbor(NeighborDto neighbor) {
		int rows = sst.insert("mybatis.mapper.neighbor.insert", neighbor);
		return rows;
	}
	
}
