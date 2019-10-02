package com.project.splace.book.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.splace.book.model.service.BookService;
import com.project.splace.host.model.vo.Host;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Space;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	// 1. 예약신청 화면으로 이동
	@RequestMapping("bookForm.sp")
	public ModelAndView bookForm(int spaceId,
								ModelAndView mv) {
		
		// 공간정보
		Space space = bookService.selectSpace(4);
		
		if(space != null) {
			
			String spaceOption1[] = space.getSpaceOption().substring(1).split("#");
			ArrayList<Option> oList = bookService.selectOption();
			// 세부옵션
			ArrayList<Option> spaceO = new ArrayList<Option>(); 
			for(String o : spaceOption1) { // 공간 옵션
				for(Option op : oList) { // OPTION 테이블
					if(op.getOptionId() == Integer.parseInt(o)) {
						spaceO.add(new Option(op.getOptionId(), op.getOptionName(), op.getOptionIcon()));
					}
				}
			}
			
			// 주의사항
			String spaceNotice[] = space.getSpaceNotice().substring(1).split("#");
			
			// 호스트정보
			Host host = bookService.selectHost(space.getSpaceId());
			
			if(host != null) {
				// 예약정보
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd (E)");
				String bookDate = sdf.format(date);
				int startTime = 18;
				int endTime = 22;
				int bookPer = 3;

				mv.addObject("space", space) 				// 예약공간정보
				  .addObject("spaceO", spaceO)				// 세부옵션
				  .addObject("spaceNotice", spaceNotice)	// 주의사항
				  .addObject("host", host)					// 호스트정보
				  .addObject("bookDate", bookDate)			// 예약날짜
				  .addObject("startTime", startTime)		// 예약시작시간
				  .addObject("endTime", endTime)			// 예약끝시간
				  .addObject("bookPer", bookPer) 			// 예약인원
				  .addObject("bookPrice", 12900);			// 예약최종가격
				mv.setViewName("book/book");
			}
		}
		
		return mv;
	}
	
	// 2. 예약목록 화면으로 이동
	@RequestMapping("bookList.sp")
	public String bookList() {
		return "book/bookList";
	}
	
	// 3. 예약내역 화면으로 이동
	@RequestMapping("bookDetail.sp")
	public String bookDetail() {
		return "book/bookDetail";
	}
	
	// 4. 예약취소 화면으로 이동
	@RequestMapping("bookCancel.sp")
	public String bookCancel() {
		return "book/bookCancel";
	}
}
