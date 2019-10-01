package com.project.splace.book.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.book.model.dao.BookDao;
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
}
