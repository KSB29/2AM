package com.project.splace.book.model.vo;

import java.util.Date;

public class Book {
	private String bookId;		// 예약번호
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
	private String typeName; 	// 공간이름
	private String spaceAttChange; // 공간대표사진
	private String spaceAddress;// 공간주소
	private String paymentId;	// 결제번호
	private Date paymentDate; 	// 결제일
	private String paymentType;	// 결제방법
	private int pStatusId;		// 결제상태번호
	private String receiptId;	// 영수증번호
	private int paymentCancelPrice; // 환불금액
	private Date approvalDate;  // 호스트승인날짜

	public Book() {}
	
	// 예약내역조회용
	public Book(String bookId, String memberId) {
		super();
		this.bookId = bookId;
		this.memberId = memberId;
	}
	// 예약목록조회용
	public Book(String memberId, int statusId) {
		this.memberId = memberId;
		this.statusId = statusId;
	}
	// 결제취소용
	public Book(String bookId, Date bookCancel, int paymentCancelPrice) {
		super();
		this.bookId = bookId;
		this.bookCancel = bookCancel;
		this.paymentCancelPrice = paymentCancelPrice;
	}
	// 리뷰작성여부
	public Book(String bookId, int spaceId, String memberId) {
		super();
		this.bookId = bookId;
		this.spaceId = spaceId;
		this.memberId = memberId;
	}

	public Book(String bookId, Date bookEnroll, int bookPrice, Date bookDate, int bookStartTime, int bookEndTime,
			int bookPer, String bookRequest, int spaceId, String memberId, int statusId, String booker,
			String bookerPhone, String bookerEmail, Date bookCancel, String spaceName, String typeName,
			String spaceAttChange, String spaceAddress, String paymentId, Date paymentDate, String paymentType,
			int pStatusId, String receiptId, int paymentCancelPrice, Date approvalDate) {
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
		this.typeName = typeName;
		this.spaceAttChange = spaceAttChange;
		this.spaceAddress = spaceAddress;
		this.paymentId = paymentId;
		this.paymentDate = paymentDate;
		this.paymentType = paymentType;
		this.pStatusId = pStatusId;
		this.receiptId = receiptId;
		this.paymentCancelPrice = paymentCancelPrice;
		this.approvalDate = approvalDate;
	}

	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
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
	public int getpStatusId() {
		return pStatusId;
	}
	public void setpStatusId(int pStatusId) {
		this.pStatusId = pStatusId;
	}
	public String getSpaceAddress() {
		return spaceAddress;
	}
	public void setSpaceAddress(String spaceAddress) {
		this.spaceAddress = spaceAddress;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getReceiptId() {
		return receiptId;
	}
	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
	}
	public int getPaymentCancelPrice() {
		return paymentCancelPrice;
	}
	public void setPaymentCancelPrice(int paymentCancelPrice) {
		this.paymentCancelPrice = paymentCancelPrice;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookEnroll=" + bookEnroll + ", bookPrice=" + bookPrice + ", bookDate="
				+ bookDate + ", bookStartTime=" + bookStartTime + ", bookEndTime=" + bookEndTime + ", bookPer="
				+ bookPer + ", bookRequest=" + bookRequest + ", spaceId=" + spaceId + ", memberId=" + memberId
				+ ", statusId=" + statusId + ", booker=" + booker + ", bookerPhone=" + bookerPhone + ", bookerEmail="
				+ bookerEmail + ", bookCancel=" + bookCancel + ", spaceName=" + spaceName + ", typeName=" + typeName
				+ ", spaceAttChange=" + spaceAttChange + ", spaceAddress=" + spaceAddress + ", paymentId=" + paymentId
				+ ", paymentDate=" + paymentDate + ", paymentType=" + paymentType + ", pStatusId=" + pStatusId
				+ ", receiptId=" + receiptId + ", paymentCancelPrice=" + paymentCancelPrice + ", approvalDate="
				+ approvalDate + "]";
	}
}
