package com.project.splace.space.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Space;
import com.project.splace.space.model.vo.SpaceAtt;
import com.project.splace.space.model.vo.Type;

@Repository("sDao")
public class SpaceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 공간ID 생성 Dao
	 * @return
	 */
	public int selectSpaceId() {
		return sqlSession.selectOne("spaceMapper.selectSpaceId");
	};

	/**
	 * 신규 공간 등록 Dao
	 * @param space
	 * @param memberId 
	 * @return
	 */
	public int insertSpace(Space space) {
		return sqlSession.insert("spaceMapper.insertSpace", space);
	}

	/**
	 * 신규 공간 사진파일 등록 Dao
	 * @param sAtt
	 * @return
	 */
	public int insertFile(SpaceAtt sAtt) {
		return sqlSession.insert("spaceMapper.insertFile", sAtt);
	}

	/**
	 * 공간 리스트 조회 Dao
	 * @param memberId
	 * @return sList
	 */
	public ArrayList<Space> selectList(String memberId) {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectList", memberId);
	}

	/**
	 * 공간 타입 리스트 조회 Dao
	 * @return tList
	 */
	public ArrayList<Type> selectType() {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectType");
	}

	/**
	 * 공간 옵션 리스트 조회 Dao
	 * @return oList
	 */
	public ArrayList<Option> selectOption() {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectOption");
	}

}
