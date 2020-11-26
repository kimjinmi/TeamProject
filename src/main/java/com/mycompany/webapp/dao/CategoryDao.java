package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.mycompany.webapp.dto.CategoryDto;

@Repository
public class CategoryDao {
	
	@Resource
	private SqlSessionTemplate sst;
	
	public List<CategoryDto> selectAll() {				//selectAll : Service가 호출함
		List<CategoryDto> list = sst.selectList("mybatis.mapper.category.selectAll");		//id를 찾아서 모두를 실행해라
		return list;
	}
	
	public List<CategoryDto> selectMurl(String UserUrl) {				
		List<CategoryDto> list = sst.selectList("mybatis.mapper.category.selectMurl", UserUrl);		
		return list;
	}

	/*public List<CategoryDto> selectbyCno(int cno) {
		List<CategoryDto> list = sst.selectList("mybatis.mapper.category.selectbyCno");
		return list;
	}*/

}
