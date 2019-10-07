package com.project.splace.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.book.model.dao.BookDao;
import com.project.splace.payment.model.dao.PaymentDao;
import com.project.splace.payment.model.vo.Payment;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private BookDao bookDao;

	@Override
	public int insertPayment(Payment payment) {
		int result = paymentDao.updateBookStatus(payment.getBookId());
		
		return paymentDao.insertPayment(payment);
	}

	@Override
	public int updatePaymentCancel(int bookId) {
		// 예약취소
		int result = bookDao.deleteBook(bookId);
		
		// 결제취소
		return paymentDao.updatePaymentCancel(bookId);
	}
}
