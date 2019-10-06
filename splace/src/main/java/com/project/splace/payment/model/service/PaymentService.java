package com.project.splace.payment.model.service;

import com.project.splace.payment.model.vo.Payment;

public interface PaymentService {

	// 결제
	public abstract int insertPayment(Payment payment);

	// 결제 취소
	public abstract int updatePaymentCancel(int bookId);
	
}
