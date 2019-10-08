package com.project.splace.qna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.qna.model.vo.QnA;

@Repository("qDao")
public class QnADao {
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   
   // 질문 등록
   public int insertQnA(QnA qna) {
      return sqlSession.insert("qnaMapper.insertQnA",qna);
   }


   // 질문 조회
   public ArrayList<QnA> selectQnA(int spaceId) {
      return (ArrayList)sqlSession.selectList("qnaMapper.selectQnA",spaceId);
   }

   // 질문 삭제 
   public int deleteQnA(int qnaId) {
      return sqlSession.update("qnaMapper.deleteQnA", qnaId);
   }
   
   


   
}