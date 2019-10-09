package com.project.splace.book.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.book.model.vo.Book;
import com.project.splace.common.PageInfo;
import com.project.splace.host.model.vo.Host;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Space;

@Repository("bookDao")
public class BookDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1. 공간 정보 조회
	 * @param spaceId
	 * @return space
	 */
	public Space selectSpace(int spaceId) {
		return sqlSession.selectOne("bookMapper.selectSpace", spaceId);
	}

	/**
	 * 1.1 상세옵션 목록 조회
	 * @return oList
	 */
	public ArrayList<Option> selectOption() {
		return (ArrayList)sqlSession.selectList("bookMapper.selectOption");
	}

	/**
	 * 2. 호스트 정보 조회
	 * @param spaceId
	 * @return host
	 */
	public Host selectHost(int spaceId) {
		return sqlSession.selectOne("bookMapper.selectHost", spaceId);
	}

	/**
	 * 3. 공간 예약 신청
	 * @param book
	 * @return result
	 */
	public int insertBook(Book book) {
		return sqlSession.insert("bookMapper.insertBook", book);
	}

	/**
	 * 4. 예약목록 조회
	 * @param book
	 * @param pi 
	 * @return bList
	 */
	public ArrayList<Book> selectBlist(Book book, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectBlist", book, rowBounds);
	}

	/**
	 * 5. 전체 예약 수 조회
	 * @param memberId
	 * @param status 
	 * @return bListCount
	 */
	public int getbListCount(Book book) {
		return sqlSession.selectOne("bookMapper.getbListCount", book);
	}

	/**
	 * 6. 예약 내역 조회
	 * @param bookId
	 * @return book
	 */
	public Book selectBook(String bookId) {
		return sqlSession.selectOne("bookMapper.selectBook", bookId);
	}

	/**
	 * 7. 예약 취소
	 * @param bookId
	 * @return result
	 */
	public int deleteBook(String bookId) {
		return sqlSession.update("bookMapper.deleteBook", bookId);
	}

	//------------------------------------------
	//--결제-------------------------------------
	//------------------------------------------
	
	/**
	 * 1. 결제
	 * @param payment
	 * @return result
	 */
	public int insertPayment(Book payment) {
		return sqlSession.insert("bookMapper.insertPayment", payment);
	}

	/**
	 * 1.1 예약 상태 UPDATE
	 * @param bookId
	 * @return result
	 */
	public int updateBookStatus(String bookId) {
		return sqlSession.update("bookMapper.updateBookStatus", bookId);
	}

	/**
	 * 2. 결제 취소
	 * @param payment
	 * @return result 
	 */
	public int updatePaymentCancel(Book book) {
		return sqlSession.update("bookMapper.updatePaymentCancel", book);
	}

	/**
	 * 자동 이용완료 처리
	 * @param bookId
	 * @return result
	 */
	public int updateBookCompleted(String bookId) {
		return sqlSession.update("bookMapper.updateBookCompleted", bookId);
	}
}
