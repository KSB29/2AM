package com.project.splace.search.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.search.model.vo.Search;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;

@Repository("searchDao")
public class SearchDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 검색 결과
	 * @param search
	 * @return
	 */
	public ArrayList<Space> searchList(Search search) {
		
		return (ArrayList)sqlSession.selectList("searchMapper.searchList", search);
	}

	/**
	 * 상세 검색
	 * @param search
	 * @return
	 */
	public ArrayList<Space> searchDetailList(Search search) {
		
		return (ArrayList)sqlSession.selectList("searchMapper.searchDetailList", search);
	}

	/** 
	 * 가격 조회
	 * @param spaceId
	 * @return
	 */
	/*
	 * public ArrayList<Price> priceList(int spaceId) {
	 * 
	 * return (ArrayList)sqlSession.selectList("searchMapper.priceList", spaceId); }
	 */

}
