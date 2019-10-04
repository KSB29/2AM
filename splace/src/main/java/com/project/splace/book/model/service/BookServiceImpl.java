package com.project.splace.book.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.book.model.dao.BookDao;
import com.project.splace.book.model.vo.Book;
import com.project.splace.common.PageInfo;
import com.project.splace.common.Pagination;
import com.project.splace.host.model.vo.Host;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Space;

@Service("bookService")
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDao bookDao;

	@Override
	public Space selectSpace(int spaceId) {
		return bookDao.selectSpace(spaceId);
	}

	@Override
	public ArrayList<Option> selectOption() {
		return bookDao.selectOption();
	}

	@Override
	public Host selectHost(int spaceId) {
		return bookDao.selectHost(spaceId);
	}

	@Override
	public int insertBook(Book book) {
		return bookDao.insertBook(book);
	}

	@Override
	public ArrayList<Book> selectBlist(int currentPage, Book book) {
		
		// 전체 예약 수 조회
		int bListCount = bookDao.getbListCount(book);
		
		// 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, bListCount);
		
		return bookDao.selectBlist(book, pi);
	}

	@Override
	public Book selectBook(int bookId) {
		return bookDao.selectBook(bookId);
	}

	@Override
	public int deleteBook(int bookId) {
		return bookDao.deleteBook(bookId);
	}
}
