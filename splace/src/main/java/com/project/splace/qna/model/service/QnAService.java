package com.project.splace.qna.model.service;

import java.util.ArrayList;

import com.project.splace.qna.model.vo.QnA;

public interface QnAService {

   
    // 질문 등록 
    public abstract int insertQnA(QnA qna);

   // 질문 조회
   public abstract ArrayList<QnA> selectQnA(int spaceId);

   // 질문 삭제 
   public abstract int deleteQnA(int qnaId);
    
    
    
   
    
   

   

}