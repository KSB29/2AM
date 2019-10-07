package com.project.splace.book.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.splace.book.model.service.BookService;
import com.project.splace.book.model.vo.Book;
import com.project.splace.common.Pagination;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;
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
		Space space = bookService.selectSpace(spaceId);
		System.out.println(space);
		if(space != null) {
			
			String spaceOption1[] = space.getSpaceOption().substring(1).split("#");
			ArrayList<Option> oList = bookService.selectOption();
			// 세부옵션
			ArrayList<Option> spaceO = new ArrayList<Option>(); 
			for(String o : spaceOption1) { // 공간 옵션
				for(Option op : oList) { // OPTION 테이블
					if(op.getOptionId().equals(o)) {
						System.out.println("일치");
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
	
	// 1.1 예약신청
	@RequestMapping("book.sp")
	public String book(Book book, int spaceId, String bookDateS, HttpSession session, RedirectAttributes rd) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Date bookDate = sdf.parse(bookDateS);
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		book.setMemberId(memberId);
		book.setSpaceId(spaceId);
		book.setBookDate(bookDate);
		
		int result = bookService.insertBook(book);
		if(result>0) {
			mailSending(book);
		} else {
			rd.addFlashAttribute("msg", "예약이 취소됐습니다.");
		}
		return "redirect:bookList.sp";
	}
	// 12시간 이후 승인안되면 자동으로 예약 취소
	@Scheduled(fixedDelay=43200000)
	public void bookDeadline() {
		
	}
	// 메일 코드
	@Autowired
	private JavaMailSender mailSender;
	public void mailSending(Book book) {
   
		String setfrom = "splace.2am@gmail.com";         
		String tomail  = book.getBookerEmail();     // 받는 사람 이메일
		String title   = "splace예약 확인 메일입니다.";      // 제목
		String content = "<html lang='ko'>"
				+"<head>"
				+"<style>"
				+".container{height: 1000px}"
				+"h3{letter-spacing: -1px;}"
				+"table{border-collapse:collapse}"
				+"table td{"
				+"border: 1px solid #4c74b8;"
				+"letter-spacing: -1px;"
				+"padding: 10px;"
				+"}"
				+"a.go{"
		        +"position: relative;"
		        +"top: 50px;"
				+"padding: 10px 100px;"
				+"letter-spacing: -1px;"
				+"background-color: #4c74b8; "
				+"color: white;"
				+"border: 0;"
				+"}"
				+"a.go:hover{"
				+"cursor: pointer; "
				+"background-color: transparent;"
				+"border: 1px solid #4c74b8;"
				+"color: #4c74b8"
				+"}"
				+"</style>"
				+"</head>"
				+"<body>"
				+"<div class='container' align='center'>"
				+"<br>"
				+"<h3>"
				+book.getBooker()
				+"님 예약해주셔서 감사합니다.</h3>"
				+"<br>"
				+"<table>"
				+"<tr>"
				+"<td>예약공간</td>"
				+"<td>"
				+book.getSpaceId()
				+"</td>"
				+"</tr>"
				+"<tr>"
				+"<td>예약날짜</td>"
				+"<td>"
				+book.getBookDate()
				+"</td>"
				+"</tr>"
				+"<tr>"
				+"<td>예약시간</td>"
				+"<td>"
				+book.getBookStartTime()
				+"시 ~ "
				+book.getBookEndTime()
				+"시, <span>("
				+(book.getBookEndTime()-book.getBookStartTime())
				+"시간)</span>"
				+"</td>"
				+"</tr>"
				+"<tr>"
				+"<td>예약인원</td>"
				+"<td>"
				+book.getBookPer()
				+"명</td>"
				+"</tr>"
				+"<tr>"
				+"<td>예약자</td>"
				+"<td>"
				+book.getBooker()
				+"</td>"
				+"</tr>"
				+"<tr>"
				+"<td>연락처</td>"
				+"<td>"
				+book.getBookerPhone()
				+"</td>"
				+"</tr>"
				+"<tr>"
				+"<td>이메일</td>"
				+"<td>"
				+book.getBookerEmail()
				+"</td>"
				+"</tr>"
				+"<tr>"
				+"<td>요청사항</td>"
				+"<td>"
				+book.getBookRequest()
				+"</td>"
				+"</tr>"
				+"<tr>"
				+"<td>결제예정금액</td>"
				+"<td>&#8361;"
				+book.getBookPrice()
				+"</td>"
				+"</tr>"
				+"</table>"
				+"<a class='go' href='http://localhost:8080/splace/'"
				+">SPLACE로 이동</a>"
				+"</div>"
				+"</body>"
				+"</html>"; // 내용
   
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper  = new MimeMessageHelper(message, true, "UTF-8");
	 
			messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail);     // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true);
     
			mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
  }
	
	// 2. 예약목록 화면으로 이동
	@RequestMapping("bookList.sp")
	public ModelAndView bookList(ModelAndView mv, HttpSession session, Integer page, String filter) {
		
		if(session.getAttribute("loginUser") == null) {
			mv.addObject("msg","로그인 해주세요!").setViewName("member/loginForm");
			return mv;
		}
		
		// filter
		int statusId = 0;
		if(filter != null) {
			statusId = Integer.parseInt(filter);
		}
		Book book = new Book(((Member)session.getAttribute("loginUser")).getMemberId(), statusId);
		
		// 현재페이지
		int currentPage = (page == null ? 1 : page);
		
		// 목록 조회
		ArrayList<Book> bList = bookService.selectBlist(currentPage, book);
		System.out.println(bList);
		
		mv.addObject("bList", bList).addObject("pi", Pagination.getPageInfo()).addObject("filter", statusId).setViewName("book/bookList");
		return mv;
	}
	
	// 3. 예약내역 화면으로 이동
	@RequestMapping("bookDetail.sp")
	public ModelAndView bookDetail(ModelAndView mv, HttpSession session, int bookId) {
		
		if(session.getAttribute("loginUser") == null) {
			mv.addObject("msg","로그인 해주세요!").setViewName("member/loginForm");
			return mv;
		}
		
		Book book = bookService.selectBook(bookId);
		System.out.println(book);
		
		// 승인기한
		Date deadline = new Date(book.getBookEnroll().getTime() + (60*60*24*1000)*2);
		// 결제번호생성
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String paymentId = sdf.format(today) + "_" + new Date().getTime();
		
		mv.addObject("book", book).addObject("deadline", deadline).addObject("paymentId", paymentId).setViewName("book/bookDetail");
		
		return mv;
	}

	// 4. 예약취소
	@RequestMapping("bookCancel.sp")
	public ModelAndView bookCancel(ModelAndView mv, int bookId, RedirectAttributes rd) {
		int result = bookService.deleteBook(bookId);
		
		mv.setViewName("redirect:bookList.sp");
		if(result>0) {
			rd.addFlashAttribute("msg", "예약이 취소되었습니다!");
		} else {
			rd.addFlashAttribute("msg", "예약이 취소되지 않았니다!");
		}
		return mv;
	}
}
