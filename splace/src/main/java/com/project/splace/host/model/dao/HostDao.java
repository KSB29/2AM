package com.project.splace.host.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.common.PageInfo;
import com.project.splace.host.model.vo.BookList;
import com.project.splace.host.model.vo.Host;
import com.project.splace.host.model.vo.HostSearch;
import com.project.splace.qna.model.vo.QnA;
import com.project.splace.space.model.vo.Space;

@Repository("hDao")
public class HostDao {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 호스트 정보 조회 Dao
	 * @param memberId
	 * @return host
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
	public int updateApplyHost(int hostId) {
		return sqlSession.update("hostMapper.updateApplyHost", hostId);
	}

	/**
	 * 호스트 정보 조회 Dao
	 * @param hostId
	 * @return hostInfo
	 */
	public Host selectInfo(int hostId) {
		return sqlSession.selectOne("hostMapper.selectInfo", hostId);
	}
	
	/**
	 * 예약리스트 수 조회 Dao
	 * @param search
	 * @return listCount
	 */
	public int getbListCount(HostSearch search) {
		return sqlSession.selectOne("hostMapper.getbListCount", search);
	}
	
	/**
	 * 예약리스트 조회 Dao
	 * @param search
	 * @param pageInfo
	 * @return bList
	 */
	public ArrayList<BookList> selectBookList(HostSearch search, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getLimit());
		return (ArrayList)sqlSession.selectList("hostMapper.selectBookList", search, rowBounds);
	}

	/**
	 * 호스트의 공간 리스트 Dao
	 * @param hostId
	 * @return sList
	 */
	public ArrayList<Space> selectSpaceList(int hostId) {
		return (ArrayList)sqlSession.selectList("hostMapper.selectSpaceList", hostId);
	}

	/**
	 * 공간 예약 승인 처리 Dao
	 * @param string
	 * @return result
	 */
	public int updateApproveBook(String bookId) {
		return sqlSession.update("hostMapper.updateApproveBook", bookId);
	}

	/**
	 * 공간 예약 취소 처리 Dao
	 * @param bookId
	 * @return result
	 */
	public int updateCancelBook(String bookId) {
		return sqlSession.update("hostMapper.updateCancelBook", bookId);
	}

	/**
	 * 공간 문의 리스트 수 조회  Dao
	 * @param search
	 * @return listCount
	 */
	public int getqListCount(HostSearch search) {
		return sqlSession.selectOne("hostMapper.getqListCount", search);
	}

	/**
	 * 공간 문의 리스트 조회  Dao
	 * @param search
	 * @param pageInfo
	 * @return qList
	 */
	public ArrayList<QnA> selectQnaList(HostSearch search, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getLimit());
		return (ArrayList)sqlSession.selectList("hostMapper.selectQnaList", search, rowBounds);
	}
	
}
