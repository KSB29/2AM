package com.project.splace.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.qna.model.dao.QnADao;
import com.project.splace.qna.model.vo.QnA;

@Service("qService")
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADao qDao;

	
	// QnA 공간 문의 등록
	@Override
	public int insertQnA(QnA qna) {
		
		return qDao.insertQnA(qna);
	} 
}
