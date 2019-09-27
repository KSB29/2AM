package com.project.splace.Book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.splace.Book.model.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	// 예약신청 화면으로 이동
	@RequestMapping("bookForm.sp")
	public String bookForm() {
		return "book/book";
	}
	
	// 예약목록 화면으로 이동
	@RequestMapping("bookList.sp")
	public String bookList() {
		return "book/bookList";
	}
	
	// 예약내역 화면으로 이동
	@RequestMapping("bookDetail.sp")
	public String bookDetail() {
		return "book/bookDetail";
	}
	
	// 예약취소 화면으로 이동
	@RequestMapping("bookCancel.sp")
	public String bookCancel() {
		return "book/bookCancel";
	}
}
