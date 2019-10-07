package com.project.splace.payment.controller;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.splace.bootpay.BootpayApi;
import com.project.splace.bootpay.model.request.Cancel;
import com.project.splace.payment.model.service.PaymentService;
import com.project.splace.payment.model.vo.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	// 결제
	@RequestMapping("payment.sp")
	public String payment(Payment payment, RedirectAttributes rd) {
		
		int result = paymentService.insertPayment(payment);
		
		if(result>0) {
			rd.addAttribute("msg", "결제되었습니다!");
		} else {
			rd.addAttribute("msg", "결제취소되었습니다!");
		}
		
		return "redirect:bookList.sp";
	}
	
	// 결제취소
	@RequestMapping("paymentCancel.sp")
	public String paymentCancel(Payment payment) throws Exception {
		BootpayApi api = new BootpayApi(
		        "5d7209d802f57e003591d59a",
		        "nKnUBiaphtcJt3Y8fELMbowN3Di6PV+Kp6JxKLVyKVQ="
		);
		api.getAccessToken();

		Cancel cancel = new Cancel();
		cancel.receipt_id = payment.getReceiptId();
		cancel.name = "관리자";
		cancel.reason = "구매자 취소요청";

		try {
		    HttpResponse res = api.cancel(cancel);
		    String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
		    System.out.println(str);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		int result = paymentService.updatePaymentCancel(payment.getBookId());
		
		return "";
	}
}
