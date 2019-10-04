package com.project.splace.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.splace.qna.model.service.QnAService;
import com.project.splace.qna.model.vo.QnA;

@Controller
public class QnAController {
	
	@Autowired
	private QnAService qService;

	@RequestMapping("insertQnA.sp")
	public ModelAndView insertQnA(QnA qna, ModelAndView mv) {
		int result = qService.insertQnA(qna);
		
		if(result>0) {
			mv.addObject("qna", qna).setViewName("spaceDetail");
		}
		return mv;
		
	}
}
