package com.project.splace.book.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.host.model.vo.Host;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Space;

@Repository("bookDao")
public class BookDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1. 공간 정보 조회
	 * @param spaceId
	 * @return space
	 */
	public Space selectSpace(int spaceId) {
		return sqlSession.selectOne("bookMapper.selectSpace", spaceId);
	}

	/**
	 * 1.1 상세옵션 목록 조회
	 * @return oList
	 */
	public ArrayList<Option> selectOption() {
		return (ArrayList)sqlSession.selectList("bookMapper.selectOption");
	}

	/**
	 * 2. 호스트 정보 조회
	 * @param spaceId
	 * @return host
	 */
	public Host selectHost(int spaceId) {
		return sqlSession.selectOne("bookMapper.selectHost", spaceId);
	}
}
