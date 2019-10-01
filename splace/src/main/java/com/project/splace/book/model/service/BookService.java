package com.project.splace.book.model.service;

import java.util.ArrayList;

import com.project.splace.host.model.vo.Host;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Space;

public interface BookService {

	// 공간 정보 조회
	public abstract Space selectSpace(int spaceId);

	// 상세옵션 목록 조회
	public abstract ArrayList<Option> selectOption();
	
	// 호스트 정보 조회
	public abstract Host selectHost(int spaceId);


}
