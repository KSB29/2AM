
package com.project.splace.admin.model.service;

import java.util.ArrayList;

import com.project.splace.admin.model.vo.Account;
import com.project.splace.admin.model.vo.TodayBook;
import com.project.splace.board.model.vo.Board;
import com.project.splace.book.model.vo.Book;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;
import com.project.splace.qna.model.vo.QnA;
import com.project.splace.space.model.vo.Space;
import com.project.splace.admin.model.vo.Payment;


public interface AdminService {

	// 정산관리
	public abstract ArrayList<Account> selectAccountList(int month);

	// 회원관리
	public abstract ArrayList<Member> selectMemberList(String memberStatus);

	// 호스트관리
	public abstract ArrayList<Host> selectHostList(int status);

	// faq관리
	public abstract ArrayList<Board> selectFaqList(int status);

	// 공지사항관리
	public abstract ArrayList<Board> selectNoticeList();

	// 호스트문의관리
	public abstract ArrayList<QnA> selectQlist();

	// 관리자문의관리
	public abstract ArrayList<QnA> selectQAdminlist();

	// 관리자답변관리
	public abstract ArrayList<QnA> selectAadminList();

	// 관리자답변작성
	public abstract int insertAnswerAdmin(QnA qna);

	// 신규회원목록(1달)
	public abstract ArrayList<Member> selectNewMemberList();

	// 오늘예약목록
	public abstract ArrayList<TodayBook> selectBookList();

    // 호스트 승인 처리
	public abstract int updateApproveHost(int hostId);
	
	// 호스트 반려 처리
	public abstract int updateCancelHost(int hostId);

	// 공간 관리
	public abstract ArrayList<Space> selectSpaceList(int status);
	
	// 공간 승인 처리
	public abstract int updateApproveSpace(int spaceId);
	
	// 공간 반려 처리
	public abstract int updateCancelSpace(int spaceId);
	
	// 예약 정보 관리
	public abstract ArrayList<Book> selectBookList(int status);

   // 결제 완료 관리 
	public abstract ArrayList<Payment> selectPaymentList(int status);

}
