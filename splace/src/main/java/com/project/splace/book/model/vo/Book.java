package com.project.splace.book.model.vo;

import java.util.Date;

public class Book {
	private int bookId;			// 예약번호
	private Date bookEnroll;	// 예약날짜
	private int bookPrice;		// 예약가격
	private Date bookDate;		// 이용날짜
	private int bookStartTime;	// 이용시작시간
	private int bookEndTime;	// 이용끝시간
	private int bookPer;		// 이용인원
	private String bookRequest;	// 요청사항
	private int spaceId;		// 공간번호
	private String memberId;	// 회원아이디
	private int statusId;		// 예약상태번호
	private String booker; 		// 예약자이름
	private String bookerPhone; // 예약자핸드폰번호
	private String bookerEmail; // 예약자이메일
	private Date bookCancel; 	// 예약취소날짜
	private String spaceName; 	// 공간이름
	private String spaceAttChange; // 공간대표사진

	public Book() {}
	public Book(int bookId, Date bookEnroll, int bookPrice, Date bookDate, int bookStartTime, int bookEndTime,
			int bookPer, String bookRequest, int spaceId, String memberId, int statusId, String booker,
			String bookerPhone, String bookerEmail, Date bookCancel, String spaceName, String spaceAttChange) {
		super();
		this.bookId = bookId;
		this.bookEnroll = bookEnroll;
		this.bookPrice = bookPrice;
		this.bookDate = bookDate;
		this.bookStartTime = bookStartTime;
		this.bookEndTime = bookEndTime;
		this.bookPer = bookPer;
		this.bookRequest = bookRequest;
		this.spaceId = spaceId;
		this.memberId = memberId;
		this.statusId = statusId;
		this.booker = booker;
		this.bookerPhone = bookerPhone;
		this.bookerEmail = bookerEmail;
		this.bookCancel = bookCancel;
		this.spaceName = spaceName;
		this.spaceAttChange = spaceAttChange;
	}
	public Book(int bookId, Date bookEnroll, int bookPrice, Date bookDate, int bookStartTime, int bookEndTime,
			int bookPer, String bookRequest, int spaceId, String memberId, int statusId, String booker,
			String bookerPhone, String bookerEmail, Date bookCancel) {
		super();
		this.bookId = bookId;
		this.bookEnroll = bookEnroll;
		this.bookPrice = bookPrice;
		this.bookDate = bookDate;
		this.bookStartTime = bookStartTime;
		this.bookEndTime = bookEndTime;
		this.bookPer = bookPer;
		this.bookRequest = bookRequest;
		this.spaceId = spaceId;
		this.memberId = memberId;
		this.statusId = statusId;
		this.booker = booker;
		this.bookerPhone = bookerPhone;
		this.bookerEmail = bookerEmail;
		this.bookCancel = bookCancel;
	}

	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public Date getBookEnroll() {
		return bookEnroll;
	}
	public void setBookEnroll(Date bookEnroll) {
		this.bookEnroll = bookEnroll;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public Date getBookDate() {
		return bookDate;
	}
	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}
	public int getBookStartTime() {
		return bookStartTime;
	}
	public void setBookStartTime(int bookStartTime) {
		this.bookStartTime = bookStartTime;
	}
	public int getBookEndTime() {
		return bookEndTime;
	}
	public void setBookEndTime(int bookEndTime) {
		this.bookEndTime = bookEndTime;
	}
	public int getBookPer() {
		return bookPer;
	}
	public void setBookPer(int bookPer) {
		this.bookPer = bookPer;
	}
	public String getBookRequest() {
		return bookRequest;
	}
	public void setBookRequest(String bookRequest) {
		this.bookRequest = bookRequest;
	}
	public int getSpaceId() {
		return spaceId;
	}
	public void setSpaceId(int spaceId) {
		this.spaceId = spaceId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public String getBooker() {
		return booker;
	}
	public void setBooker(String booker) {
		this.booker = booker;
	}
	public String getBookerPhone() {
		return bookerPhone;
	}
	public void setBookerPhone(String bookerPhone) {
		this.bookerPhone = bookerPhone;
	}
	public String getBookerEmail() {
		return bookerEmail;
	}
	public void setBookerEmail(String bookerEmail) {
		this.bookerEmail = bookerEmail;
	}
	public Date getBookCancel() {
		return bookCancel;
	}
	public void setBookCancel(Date bookCancel) {
		this.bookCancel = bookCancel;
	}
	public String getSpaceName() {
		return spaceName;
	}
	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}
	public String getSpaceAttChange() {
		return spaceAttChange;
	}
	public void setSpaceAttChange(String spaceAttChange) {
		this.spaceAttChange = spaceAttChange;
	}
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookEnroll=" + bookEnroll + ", bookPrice=" + bookPrice + ", bookDate="
				+ bookDate + ", bookStartTime=" + bookStartTime + ", bookEndTime=" + bookEndTime + ", bookPer="
				+ bookPer + ", bookRequest=" + bookRequest + ", spaceId=" + spaceId + ", memberId=" + memberId
				+ ", statusId=" + statusId + ", booker=" + booker + ", bookerPhone=" + bookerPhone + ", bookerEmail="
				+ bookerEmail + ", bookCancel=" + bookCancel + ", spaceName=" + spaceName + ", spaceAttChange="
				+ spaceAttChange + "]";
	}
}
