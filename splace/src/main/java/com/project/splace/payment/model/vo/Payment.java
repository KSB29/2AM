package com.project.splace.payment.model.vo;

import java.util.Date;

public class Payment {
	private String paymentId;
	private Date paymentDate;
	private String paymentType;
	private String paymentStatus;
	private int bookId;
	private String receiptId;
	
	public Payment() {}
	public Payment(String paymentId, Date paymentDate, String paymentType, String paymentStatus, int bookId,
			String receiptId) {
		super();
		this.paymentId = paymentId;
		this.paymentDate = paymentDate;
		this.paymentType = paymentType;
		this.paymentStatus = paymentStatus;
		this.bookId = bookId;
		this.receiptId = receiptId;
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
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getReceiptId() {
		return receiptId;
	}
	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
	}
	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", paymentDate=" + paymentDate + ", paymentType=" + paymentType
				+ ", paymentStatus=" + paymentStatus + ", bookId=" + bookId + ", receiptId=" + receiptId + "]";
	}
}
