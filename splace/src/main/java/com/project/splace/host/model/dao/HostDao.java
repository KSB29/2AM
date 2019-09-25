package com.project.splace.host.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.host.model.vo.Host;

@Repository("hDao")
public class HostDao {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 호스트 정보 조회 Dao
	 * @param memberId
	 * @return
	 */
	public Host selectOne(String memberId) {
		return sqlSession.selectOne("hostMapper.selectOne", memberId);
	}

	/**
	 * 호스트 정보 등록 Dao
	 * @param host
	 * @return result
	 */
	public int insertHost(Host host) {
		return sqlSession.insert("hostMapper.insertHost", host);
	}

	/**
	 * 호스트 정보 수정 Dao
	 * @param host
	 * @return result
	 */
	public int updateHost(Host host) {
		return sqlSession.update("hostMapper.updateHost", host);
	}

	/**
	 * 호스트 승인 요청 Dao
	 * @param hostId
	 * @param memberId
	 * @return result
	 */
	public int applyHost(int hostId) {
		return sqlSession.update("hostMapper.applyHost", hostId);
	}
}
