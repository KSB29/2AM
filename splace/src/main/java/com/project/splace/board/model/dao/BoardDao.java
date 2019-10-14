package com.project.splace.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.board.model.vo.Board;
import com.project.splace.common.PageInfo;

/**
 * @author user1
 *
 */
/**
 * @author user1
 *
 */
@Repository("boardDao")
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1. faq작성
	 * @param faq
	 * @return result
	 */
	public int insertFaq(Board faq) {
		return sqlSession.insert("boardMapper.insertFaq", faq);
	}

	/**
	 * 2. faq삭제
	 * @param faqId
	 * @return result
	 */
	public int deleteFaq(int faqId) {
		return sqlSession.update("boardMapper.deleteFaq", faqId);
	}

	/**
	 * 3. faq조회
	 * @param faqId
	 * @return faq
	 */
	public Board selectFaq(int faqId) {
		return sqlSession.selectOne("boardMapper.selectFaq", faqId);
	}

	/**
	 * 4. faq수정
	 * @param faq
	 * @return result
	 */
	public int updateFaq(Board faq) {
		return sqlSession.update("boardMapper.updateFaq", faq);
	}

	/**
	 * 5. 공지사항작성
	 * @param notice
	 * @return result
	 */
	public int insertNotice(Board notice) {
		return sqlSession.insert("boardMapper.insertNotice", notice);
	}

	/**
	 * 6. 공지사항삭제
	 * @param noticeId
	 * @return result
	 */
	public int deleteNotice(int noticeId) {
		return sqlSession.delete("boardMapper.deleteNotice", noticeId);
	}

	/**
	 * 7. 공지사항 조회
	 * @param noticeId
	 * @return notice
	 */
	public Board selectNotice(int noticeId) {
		return sqlSession.selectOne("boardMapper.selectNotice", noticeId);
	}

	/**
	 * 8. 공지사항 수정
	 * @param notice
	 * @return result
	 */
	public int updateNotice(Board notice) {
		return sqlSession.update("boardMapper.updateNotice", notice);
	}

	// 회원화면------------------------------------------------------------------------


	/**
	 * 9. 전체 공지사항 수 조회 
	 * @param statusId 
	 * @return bListCount
	 */
	public int getNoticeListCount() {
		return sqlSession.selectOne("boardMapper.getNoticeListCount");
	}
	/**
	 * 10. 공지사항 목록 조회
	 * @param pi
	 * @return bLisst
	 */
	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList", rowBounds);
	}

	/**
	 * 11. 전체 FAQ 수 조회
	 * @param statusId 
	 * @return bListCount
	 */
	public int getFAQListCount(int statusId) {
		return sqlSession.selectOne("boardMapper.getFAQListCount",statusId);
	}

	/**
	 * 12. FAQ 목록 조회
	 * @param pi
	 * @param statusId 
	 * @return bList
	 */
	public ArrayList<Board> selectFAQList(PageInfo pi, int statusId) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectFAQList", statusId, rowBounds);
	}
}
