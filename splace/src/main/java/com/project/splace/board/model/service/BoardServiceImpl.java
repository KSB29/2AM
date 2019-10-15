package com.project.splace.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.board.model.dao.BoardDao;
import com.project.splace.board.model.vo.Board;
import com.project.splace.common.PageInfo;
import com.project.splace.common.Pagination;

import oracle.net.aso.f;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;

	// 1. faq작성
	@Override
	public int insertFaq(Board faq) {
		return boardDao.insertFaq(faq);
	}

	// 2. faq삭제
	@Override
	public int deleteFaq(int faqId) {
		return boardDao.deleteFaq(faqId);
	}

	// 3. faq조회
	@Override
	public Board selectFaq(int faqId) {
		return boardDao.selectFaq(faqId);
	}

	// 4. faq수정
	@Override
	public int updateFaq(Board faq) {
		return boardDao.updateFaq(faq);
	}

	// 5. 공지사항작성
	@Override
	public int insertNotice(Board notice) {
		return boardDao.insertNotice(notice);
	}

	// 6. 공지사항삭제
	@Override
	public int deleteNotice(int noticeId) {
		return boardDao.deleteNotice(noticeId);
	}

	// 7. 공지사항조회
	@Override
	public Board selectNotice(int noticeId) {
		return boardDao.selectNotice(noticeId);
	}

	// 8. 공지사항수정
	@Override
	public int updateNotice(Board notice) {
		return boardDao.updateNotice(notice);
	}
	
	// 회원화면------------------------------------------------------------------------

	// 9. 공지사항목록 조회
	@Override
	public ArrayList<Board> selectNoticeList(int currentPage) {
		// 전체 공지사항 수 조회
		int bListCount = boardDao.getNoticeListCount();
		
		// 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, bListCount);
		
		return boardDao.selectNoticeList(pi);
	}

	// 10. FAQ목록 조회
	@Override
	public ArrayList<Board> selectFAQList(int currentPage, int statusId) {
		// 전체 공지사항 수 조회
		int bListCount = boardDao.getFAQListCount(statusId);
		
		// 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, bListCount);
		
		return boardDao.selectFAQList(pi, statusId);
	}
}
