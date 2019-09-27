package com.project.splace.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.splace.payment.model.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	// 결제 화면으로 이동
	@RequestMapping("paymentForm.sp")
	public String paymentForm() {
		return "";
	}
}
