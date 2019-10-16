package com.project.splace.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.admin.model.vo.Account;
import com.project.splace.admin.model.vo.TodayBook;
import com.project.splace.board.model.vo.Board;
import com.project.splace.book.model.vo.Book;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;
import com.project.splace.qna.model.vo.QnA;
import com.project.splace.space.model.vo.Space;

@Repository("adminDao")
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1. 정산관리
	 * @param month
	 * @return aList
	 */
	public ArrayList<Account> selectAccountList(int month) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAccountList", month);
	}

	/**
	 * 2. 회원관리
	 * @param memberStatus
	 * @return mList
	 */
	public ArrayList<Member> selectMemberList(String memberStatus) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", memberStatus);
	}

	/**
	 * 3. 호스트관리
	 * @param status
	 * @return hList
	 */
	public ArrayList<Host> selectHostList(int status) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectHostList", status);
	}

	/**
	 * 4. faq관리
	 * @param status 
	 * @return bList
	 */
	public ArrayList<Board> selectFaqList(int status) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectFaqList", status);
	}

	/**
	 * 5. 공지사항 관리
	 * @return bList
	 */
	public ArrayList<Board> selectNoticeList() {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList");
	}

	/**
	 * 6. 호스트문의관리
	 * @return qList
	 */
	public ArrayList<QnA> selectQlist() {
		return (ArrayList)sqlSession.selectList("adminMapper.selectQlist");
	}

	/**
	 * 7. 관리자문의관리
	 * @return qList
	 */
	public ArrayList<QnA> selectQAdminlist() {
		return (ArrayList)sqlSession.selectList("adminMapper.selectQAdminlist");
	}

  /**
	 * 8. 관리자답변관리
	 * @return aList
	 */
	public ArrayList<QnA> selectAadminList() {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdminlist");
	}

	/**
	 * 9. 관리자답변작성
	 * @param qna
	 * @return result
	 */
	public int insertAnswerAdmin(QnA qna) {
		return sqlSession.update("adminMapper.insertAnswerAdmin", qna);
	}

	/**
	 * 10. 신규회원목록(1달)
	 * @return mList
	 */
	public ArrayList<Member> selectNewMemberList() {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNewMemberlist");
	}

	/**
	 * 11. 오늘예약목록
	 * @return bList
	 */
	public ArrayList<TodayBook> selectBookList() {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBookList");
	}
  
  /**
	 * 12. 호스트 승인 처리
	 * @param hostId
	 * @return result
	 */
	public int updateApproveHost(int hostId) {
		return sqlSession.update("adminMapper.updateApproveHost", hostId);
	}

	/**
	 * 13. 호스트 반려 처리
	 * @param hostId
	 * @return result
	 */
	public int updateCancelHost(int hostId) {
		return sqlSession.update("adminMapper.updateCancelHost", hostId);
	}

	/**
	 * 14. 공간 관리
	 * @param status
	 * @return sList
	 */
	public ArrayList<Space> selectSpaceList(int status) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectSpaceList", status);
	}

	/**
	 * 15. 공간 승인 처리
	 * @param spaceId
	 * @return result
	 */
	public int updateApproveSpace(int spaceId) {
		return sqlSession.update("adminMapper.updateApproveSpace", spaceId);
	}

	/**
	 * 16. 공간 반려 처리
	 * @param spaceId
	 * @return result
	 */
	public int updateCancelSpace(int spaceId) {
		return sqlSession.update("adminMapper.updateCancelSpace", spaceId);
  }

	/**
	 * 17. 예약 정보 관리
	 * @param status
	 * @return bList
	 */
	public ArrayList<Book> selectBookList(int status) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllBookList", status);
	}

}
