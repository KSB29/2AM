package com.project.splace.search.model.service;

import java.util.ArrayList;

import com.project.splace.search.model.vo.Search;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;

public interface SearchService {
	
	// 공간 검색	
	public abstract ArrayList<Space> searchList(Search search);
	
	// 공간 상세 검색
	public abstract ArrayList<Space> searchDetailList(Search search);
	
	// 가격 조회
	/* public abstract ArrayList<Price> priceList(int spaceId); */

	
}
