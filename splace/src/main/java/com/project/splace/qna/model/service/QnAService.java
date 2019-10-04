package com.project.splace.qna.model.service;

import com.project.splace.qna.model.vo.QnA;

public interface QnAService {

	/**
	 * QnA- 공간 문의 등록
	 * @param qna
	 * @return result
	 */
	public abstract int insertQnA(QnA qna);

}
