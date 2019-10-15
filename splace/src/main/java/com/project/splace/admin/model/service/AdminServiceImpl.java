package com.project.splace.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.admin.model.dao.AdminDao;
import com.project.splace.admin.model.vo.Account;
import com.project.splace.admin.model.vo.TodayBook;
import com.project.splace.board.model.vo.Board;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;
import com.project.splace.qna.model.vo.QnA;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;

	/* 1. 정산관리
	 * return aList
	 */
	@Override
	public ArrayList<Account> selectAccountList(int month) {
		return adminDao.selectAccountList(month);
	}

	/* 2. 회원관리
	 * return mList
	 */
	@Override
	public ArrayList<Member> selectMemberList(String memberStatus) {
		return adminDao.selectMemberList(memberStatus);
	}

	/* 3. 호스트관리
	 * return hList
	 */
	@Override
	public ArrayList<Host> selectHostList(int status) {
		return adminDao.selectHostList(status);
	}

	/* 4. faq관리
	 * return bList
	 */
	@Override
	public ArrayList<Board> selectFaqList(int status) {
		return adminDao.selectFaqList(status);
	}

	/* 5. 공지사항관리
	 * return bList
	 */
	@Override
	public ArrayList<Board> selectNoticeList() {
		return adminDao.selectNoticeList();
	}

	/* 6. 호스트문의관리
	 * return qList
	 */
	@Override
	public ArrayList<QnA> selectQlist() {
		return adminDao.selectQlist();
	}

	/* 7. 관리자문의관리
	 * return qList
	 */
	@Override
	public ArrayList<QnA> selectQAdminlist() {
		return adminDao.selectQAdminlist();
	}

	/* 8. 관리자답변관리
	 * return aList
	 */
	@Override
	public ArrayList<QnA> selectAadminList() {
		return adminDao.selectAadminList();
	}

	/* 9. 관리자답변작성
	 * return result
	 */
	@Override
	public int insertAnswerAdmin(QnA qna) {
		return adminDao.insertAnswerAdmin(qna);
	}

	/* 10. 신규회원목록(1달)
	 * return mList
	 */
	@Override
	public ArrayList<Member> selectNewMemberList() {
		return adminDao.selectNewMemberList();
	}

	/* 11. 오늘예약목록
	 * return bList
	 */
	@Override
	public ArrayList<TodayBook> selectBookList() {
		return adminDao.selectBookList();
	}
}
