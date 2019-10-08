package com.project.splace.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.qna.model.dao.QnADao;
import com.project.splace.qna.model.vo.QnA;

@Service("qService")
public class QnAServiceImpl implements QnAService{

   @Autowired
   private QnADao qDao;

   // 질문 등록
   @Override
   public int insertQnA(QnA qna) {

      return qDao.insertQnA(qna);
   }

   // 질문 조회
   @Override
   public ArrayList<QnA> selectQnA(int spaceId) {
      return qDao.selectQnA(spaceId);
   }

   // 질문 삭제 
   @Override
   public int deleteQnA(int qnaId) {
      return qDao.deleteQnA(qnaId);
   }
   
   

   
}