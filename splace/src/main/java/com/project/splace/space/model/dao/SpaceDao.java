package com.project.splace.space.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Price;
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

	// -------------------------191002 추가 -------------------------------------------------
	
	/**
	 * 공간 상세보기 조회 
	 * @param spaceId
	 * @return
	 */
	public Space selectspaceDetail(int spaceId) {
		
		return sqlSession.selectOne("spaceMapper.selectspaceDetail",spaceId);
  }
  
	/**
	 * 공간 가격 조회 Dao
	 * @param spaceId
	 * @return pList
	 */
	public ArrayList<Price> selectPrice(int spaceId) {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectPrice", spaceId);
	}

	/**
	 * 공간 가격 등록 Dao
	 * @param price
	 * @return result
	 */
	public int insertPrice(Price price) {
		return sqlSession.insert("spaceMapper.insertPrice", price);
	}
	
	/**
	 * 1인당 추가 금액 저장
	 * @param space
	 * @return result
	 */
	public int updateAddPrice(Space space) {
		return sqlSession.update("spaceMapper.updateAddPrice", space);
	}

}
