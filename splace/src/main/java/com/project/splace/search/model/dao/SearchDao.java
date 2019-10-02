package com.project.splace.search.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.search.model.vo.Search;
import com.project.splace.space.model.vo.Space;

@Repository("searchDao")
public class SearchDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Space> searchList(Search search) {
		
		return (ArrayList)sqlSession.selectList("searchMapper.searchList", search);
	}

	public ArrayList<Space> searchDetailList(Search search) {
		
		return (ArrayList)sqlSession.selectList("searchMapper.searchDeatilList", search);
	}

}
