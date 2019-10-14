package com.project.splace.qna.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.project.splace.common.PageInfo;
import com.project.splace.common.Pagination;
import com.project.splace.member.model.vo.Member;
import com.project.splace.qna.model.service.QnAService;
import com.project.splace.qna.model.vo.QnA;

@Controller
public class QnAController {
   
   @Autowired
   private QnAService qService;

   // 질문 등록
   @ResponseBody
   @RequestMapping("insertQnA.sp")
   public String insertQnA(QnA qna,HttpSession session,ModelAndView mv) {
      String qMemberId = ((Member)session.getAttribute("loginUser")).getMemberId();
      qna.setqMemberId(qMemberId);
      
      System.out.println("아이디 : " + qMemberId );
      
      int result = qService.insertQnA(qna);
      
      if(result>0) {
         return "success";
       }else {
          return "fail";
       }
      
   }
   
   // 질문 출력
   @ResponseBody
   @RequestMapping(value="selectQnA.sp", produces="application/json; charset=utf8")
   public String selectQnA(int spaceId,Integer page) {
      
     int currentPage = (page == null ? 1 : page);
      
      ArrayList<QnA> qList = qService.selectQnA(spaceId,currentPage);
      
      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

      return gson.toJson(qList);
      
   }
   
   
   @ResponseBody
   @RequestMapping("qnaPaging.sp")
   public String pageInfo(int spaceId, Integer page) {
      int currentPage = (page == null ? 1 : page);
      ArrayList<QnA> qList = qService.selectQnA(spaceId,currentPage);

      
      return new Gson().toJson(Pagination.getPageInfo());
      
   }
   
   
   
   // 질문 삭제 
   @ResponseBody
   @RequestMapping("deleteQnA.sp")
   public String deleteQnA(int qnaId) {
      int result = qService.deleteQnA(qnaId);
      
      if(result>0) {
         return "ok";
         
      }else {
         return "no";
      }
   }
   
   
   
   
   
}