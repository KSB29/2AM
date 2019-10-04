package com.project.splace.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.qna.model.vo.QnA;

@Repository("qDao")
public class QnADao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 
	 * QnA 공간 문의 등록
	 * @param qna
	 * @return result
	 */
	public int insertQnA(QnA qna) {
		return sqlSession.insert("qnaMapper.insertQnA", qna);
	}
}
