package com.project.splace.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.payment.model.vo.Payment;

@Repository("paymentDao")
public class PaymentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1. 결제
	 * @param payment
	 * @return result
	 */
	public int insertPayment(Payment payment) {
		return sqlSession.insert("paymentMapper.insertPayment", payment);
	}

	/**
	 * 1.1 예약 상태 UPDATE
	 * @param bookId
	 * @return result
	 */
	public int updateBookStatus(int bookId) {
		return sqlSession.update("paymentMapper.updateBookStatus", bookId);
	}

	/**
	 * 2. 결제 취소
	 * @param payment
	 * @return result 
	 */
	public int updatePaymentCancel(int bookId) {
		return sqlSession.update("paymentMapper.updatePaymentCancel", bookId);
	}
}
