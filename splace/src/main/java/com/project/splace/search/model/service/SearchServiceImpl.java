package com.project.splace.search.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.search.model.dao.SearchDao;
import com.project.splace.search.model.vo.Search;
import com.project.splace.space.model.vo.Space;

@Service("searchtService")
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchDao searchDao;
	
	// 공간 검색 	
	@Override
	public ArrayList<Space> searchList(Search search) {
		return searchDao.searchList(search);
	}
	
	// 공간 상세 검색
	@Override
	public ArrayList<Space> searchDetailList(Search search) {
		
		return searchDao.searchDetailList(search);
	}
}
