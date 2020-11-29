package com.mycompany.webapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<CategoryDto> selectMurl(String murl) {				
		List<CategoryDto> list = sst.selectList("mybatis.mapper.category.selectMurl", murl);		
		return list;
	}
	
	public List<CategoryDto> selectAllCount() {				
		List<CategoryDto> list = sst.selectList("mybatis.mapper.category.selectAllCount");		
		return list;
	}

	public int insert(String addCategory) {
		int row = sst.insert("mybatis.mapper.category.insert", addCategory);
		return row;
		
	}

	public int delete(int cno) {
		int row = sst.insert("mybatis.mapper.category.delete", cno);
		return row;
		
	}

	public void update(int cno, String editCategory2) {
		Map map = new HashMap();
		map.put("cno", cno);
		map.put("editccontent", editCategory2);
		int row =  sst.update("mybatis.mapper.category.update", map);
		
	}

	/*public List<CategoryDto> selectbyCno(int cno) {
		List<CategoryDto> list = sst.selectList("mybatis.mapper.category.selectbyCno");
		return list;
	}*/

}
