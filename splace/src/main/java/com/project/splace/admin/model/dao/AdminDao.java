package com.project.splace.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.admin.model.vo.Account;
import com.project.splace.admin.model.vo.Payment;
import com.project.splace.board.model.vo.Board;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;
import com.project.splace.qna.model.vo.QnA;

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

	public ArrayList<Payment> selectPaymentList(int status) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectPaymentlist",status);
		
	}

}
