package com.project.splace.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.main.model.vo.Notice;
import com.project.splace.member.model.vo.Member;
import com.project.splace.space.model.vo.Space;

@Repository("mainDao")
public class MainDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 새로 등록된 공간 리스트
	 * @return
	 */
	public ArrayList<Space> newSpace() {
		
		return (ArrayList)sqlSession.selectList("mainMapper.newSpace");
	}

	
	/**
	 * 추천 공간 리스트
	 * @return
	 */
	public ArrayList<Space> bestSpace() {
		
		return (ArrayList)sqlSession.selectList("mainMapper.bestSpace");
	}


	public ArrayList<Notice> noticeSelect(String userId) {
		return (ArrayList)sqlSession.selectList("mainMapper.noticeSelect", userId);
	}
}