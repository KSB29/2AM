package com.project.splace.admin.model.vo;

import java.sql.Date;

public class Payment {
	private String memberId;
	private String paymentId;
	private int bookPrice;
	private	String booker; 
	private Date paymentDate;
	private Date paymentCancel;
	private String paymentType;
	private String receiptId;
	private int paymentCanclePrice;
	private int bookId;
	private int statusId;

	
	public Payment() {
		// TODO Auto-generated constructor stub
	}


	public Payment(String memberId, String paymentId, int bookPrice, String booker, Date paymentDate,
			Date paymentCancel, String paymentType, String receiptId, int paymentCanclePrice, int bookId,
			int statusId) {
		super();
		this.memberId = memberId;
		this.paymentId = paymentId;
		this.bookPrice = bookPrice;
		this.booker = booker;
		this.paymentDate = paymentDate;
		this.paymentCancel = paymentCancel;
		this.paymentType = paymentType;
		this.receiptId = receiptId;
		this.paymentCanclePrice = paymentCanclePrice;
		this.bookId = bookId;
		this.statusId = statusId;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getPaymentId() {
		return paymentId;
	}


	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}


	public int getBookPrice() {
		return bookPrice;
	}


	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}


	public String getBooker() {
		return booker;
	}


	public void setBooker(String booker) {
		this.booker = booker;
	}


	public Date getPaymentDate() {
		return paymentDate;
	}


	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}


	public Date getPaymentCancel() {
		return paymentCancel;
	}


	public void setPaymentCancel(Date paymentCancel) {
		this.paymentCancel = paymentCancel;
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


	public int getPaymentCanclePrice() {
		return paymentCanclePrice;
	}


	public void setPaymentCanclePrice(int paymentCanclePrice) {
		this.paymentCanclePrice = paymentCanclePrice;
	}


	public int getBookId() {
		return bookId;
	}


	public void setBookId(int bookId) {
		this.bookId = bookId;
	}


	public int getStatusId() {
		return statusId;
	}


	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	
	
	
	
}