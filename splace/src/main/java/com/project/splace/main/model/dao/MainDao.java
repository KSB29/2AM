package com.project.splace.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.member.model.vo.Member;
import com.project.splace.space.model.vo.Space;

@Repository("mainDao")
public class MainDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Space> newSpaceList() {
		
		return (ArrayList)sqlSession.selectList("mainMapper.newSelectList");
	}

}