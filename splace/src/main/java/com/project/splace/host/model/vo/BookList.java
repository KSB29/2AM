package com.project.splace.host.model.vo;

import java.sql.Date;

public class BookList {
	
	private String bookId;
	private Date bookEnroll;
	private int bookPrice;
	private Date bookDate;
	private int bookStartTime;
	private int bookEndTime;
	private int bookPer;
	private String bookRequest;
	private String booker;
	private String bookerPhone;
	private String bookerEmail;
	private Date bookCancel;
	private Date approvalDate;
	private int spaceId;
	private String memberId;
	private int statusId;
	private String spaceName;
	private String memberName;
	private String statusName;
	
	public BookList() {}

	public BookList(String bookId, Date bookEnroll, int bookPrice, Date bookDate, int bookStartTime, int bookEndTime,
			int bookPer, String bookRequest, String booker, String bookerPhone, String bookerEmail, Date bookCancel,
			Date approvalDate, int spaceId, String memberId, int statusId) {
		super();
		this.bookId = bookId;
		this.bookEnroll = bookEnroll;
		this.bookPrice = bookPrice;
		this.bookDate = bookDate;
		this.bookStartTime = bookStartTime;
		this.bookEndTime = bookEndTime;
		this.bookPer = bookPer;
		this.bookRequest = bookRequest;
		this.booker = booker;
		this.bookerPhone = bookerPhone;
		this.bookerEmail = bookerEmail;
		this.bookCancel = bookCancel;
		this.approvalDate = approvalDate;
		this.spaceId = spaceId;
		this.memberId = memberId;
		this.statusId = statusId;
	}

	public BookList(String bookId, Date bookEnroll, int bookPrice, Date bookDate, int bookStartTime, int bookEndTime,
			int bookPer, String bookRequest, String booker, String bookerPhone, String bookerEmail, Date bookCancel,
			Date approvalDate, int spaceId, String memberId, int statusId, String spaceName, String memberName,
			String statusName) {
		super();
		this.bookId = bookId;
		this.bookEnroll = bookEnroll;
		this.bookPrice = bookPrice;
		this.bookDate = bookDate;
		this.bookStartTime = bookStartTime;
		this.bookEndTime = bookEndTime;
		this.bookPer = bookPer;
		this.bookRequest = bookRequest;
		this.booker = booker;
		this.bookerPhone = bookerPhone;
		this.bookerEmail = bookerEmail;
		this.bookCancel = bookCancel;
		this.approvalDate = approvalDate;
		this.spaceId = spaceId;
		this.memberId = memberId;
		this.statusId = statusId;
		this.spaceName = spaceName;
		this.memberName = memberName;
		this.statusName = statusName;
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

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
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

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	@Override
	public String toString() {
		return "BookList [bookId=" + bookId + ", bookEnroll=" + bookEnroll + ", bookPrice=" + bookPrice + ", bookDate="
				+ bookDate + ", bookStartTime=" + bookStartTime + ", bookEndTime=" + bookEndTime + ", bookPer="
				+ bookPer + ", bookRequest=" + bookRequest + ", booker=" + booker + ", bookerPhone=" + bookerPhone
				+ ", bookerEmail=" + bookerEmail + ", bookCancel=" + bookCancel + ", approvalDate=" + approvalDate
				+ ", spaceId=" + spaceId + ", memberId=" + memberId + ", statusId=" + statusId + ", spaceName="
				+ spaceName + ", memberName=" + memberName + ", statusName=" + statusName + "]";
	}	

}
