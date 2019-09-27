package com.project.splace.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("paymentDao")
public class PaymentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
