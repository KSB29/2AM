package com.project.splace.board.model.service;

import java.util.ArrayList;

import com.project.splace.board.model.vo.Board;

public interface BoardService {

	// 1. faq작성
	public abstract int insertFaq(Board faq);

	// 2. faq삭제
	public abstract int deleteFaq(int faqId);

	// 3. faq조회
	public abstract Board selectFaq(int faqId);

	// 4. faq수정
	public abstract int updateFaq(Board faq);

	// 5. 공지사항작성
	public abstract int insertNotice(Board notice);

	// 6. 공지사항삭제
	public abstract int deleteNotice(int noticeId);

	// 7. 공지사항조회
	public abstract Board selectNotice(int noticeId);

	// 8. 공지사항수정
	public abstract int updateNotice(Board notice);

	// 회원화면------------------------------------------------------------------------
	
	// 9. 공지사항목록 조회
	public abstract ArrayList<Board> selectNoticeList();

}
