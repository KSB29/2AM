package com.project.splace.book.model.service;

import java.util.ArrayList;

import com.project.splace.book.model.vo.Book;
import com.project.splace.host.model.vo.Host;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Space;

public interface BookService {

	// 공간 정보 조회
	public abstract Space selectSpace(int spaceId);

	// 상세옵션 목록 조회
	public abstract ArrayList<Option> selectOption();
	
	// 호스트 정보 조회
	public abstract Host selectHost(int spaceId);

	// 예약 신청
	public abstract int insertBook(Book book);

	// 예약목록 조회
	public abstract ArrayList<Book> selectBlist(int currentPage, Book book);

	// 예약 내역 조회
	public abstract Book selectBook(Book book);

	// 예약 취소
	public abstract int deleteBook(String bookId);
	
	//------------------------------------------
	//--결제-------------------------------------
	//------------------------------------------
	
	// 결제
	public abstract int insertPayment(Book payment);

	// 결제 취소
	public abstract int updatePaymentCancel(Book book);

	// 리뷰작성여부
	public abstract int selectReviewCount(Book book);


}
