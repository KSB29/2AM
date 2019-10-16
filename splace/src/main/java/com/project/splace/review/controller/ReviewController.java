package com.project.splace.review.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.project.splace.book.model.vo.Book;
import com.project.splace.member.model.vo.Member;
import com.project.splace.review.model.service.ReviewService;
import com.project.splace.review.model.vo.Review;
import com.project.splace.review.model.vo.Review_ATT;

@Controller
public class ReviewController {
   
   @Autowired
   private ReviewService rService;
   
   // 리뷰 등록 (글 + 별점 +사진 )   
   @ResponseBody
   @RequestMapping("insertReview.sp")
   public String insertReview(List<MultipartFile> files, Review review, HttpServletRequest request,HttpSession session) {
      System.out.println(files);
      //,MultipartFile uploadFile , List<MultipartFile> files
      String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
      review.setMemberId(memberId);/*
                               * System.out.println(files.get(0).getOriginalFilename());
                               * System.out.println(files.get(1).getOriginalFilename());
                               * System.out.println(files.get(2).getOriginalFilename());
                               */
      System.out.println("넘어왓냐!");
      int result = rService.insertReview(review,files,request);
      System.out.println(result);
      if(result>0) {
         return "ok"; 
      }else {
         return "no";
      }
   }
   
   // 리뷰 조회 (글)
   @ResponseBody
   @RequestMapping(value="ReviewList.sp", produces="application/json; charset=utf-8")
   public String selectReview(int spaceId) {
      ArrayList<Review> reList = rService.selectReview(spaceId);
      
      System.out.println("리스트 :" +reList);
      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

      System.out.println("리스트 :" +gson.toJson(reList));
      return gson.toJson(reList);
   }
   
   // 리뷰 조회 (사진 )
   @ResponseBody
   @RequestMapping("reviewListImg.sp")
   public ArrayList<Review_ATT> selectReviewImg(int reviewId) {
      ArrayList<Review_ATT> reImgList = rService.selectReviewImg(reviewId);
      System.out.println("reImgList"+reImgList);
      return reImgList;
      
   }
   
   // 리뷰 작성한 이용자가 있는지 카운트 
   @ResponseBody
   @RequestMapping("ReviewBtn.sp")
   public String selectWriteBtn(Book book,HttpSession session) {
      String bMamberId = ((Member)session.getAttribute("loginUser")).getMemberId();
      book.setMemberId(bMamberId);
      System.out.println("book"+book);      
      int result = rService.selectWriteBtn(book);
      System.out.println("int result"+result);      
      if(result==0) {
         return "write";
      }else{
         return "notWrite";
      }
   }
   
   
   // 리뷰 수정용 조회해오기
   @ResponseBody
   @RequestMapping(value="reviewUpdate.sp", produces="application/json; charset=utf-8")
   public String reviewUpdate(int reviewId){
      System.out.println(reviewId);
      Review review = rService.reviewUpdate(reviewId);
      
      ArrayList<Review_ATT> reImgList = rService.selectReviewImg(reviewId);
      System.out.println("reImgList"+reImgList);
      
      HashMap<String, Object> rh = new HashMap<String, Object>();
      rh.put("review", review);
      rh.put("att", reImgList);

      System.out.println(rh);
      return new Gson().toJson(rh);
   }
   
   // 리뷰 수정 저장 
   @ResponseBody
   @RequestMapping("reviewUpdateSubmit.sp")
   public String reviewUpdateSubmit(List<MultipartFile> files, Review review,HttpServletRequest request,HttpSession session) {
      String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
      review.setMemberId(memberId);
      
      System.out.println("수정 리뷰 아이디 컨트롤 : " +review.getReviewId());
      System.out.println("review.getReviewId()"+review.getReviewId());
      
      int result = rService.reviewUpdateSubmit(review,files,request);
      System.out.println(result);
      if(result>0) {
         return "ok"; 
      }else {
         return "no";
      }
   }
   
   
   
   
   
   // 리뷰 삭제 
   @ResponseBody
   @RequestMapping("reviewDelete.sp")
   public String reviewDelete(int reviewId,HttpServletRequest request) {
      
      // 해당 글 조회
      
      // 글번호에 맞는 글 조회 
      ArrayList<Review_ATT> reImgList = rService.selectReviewImg(reviewId);
      System.out.println("삭제 결과 reImgList: " + reImgList);
      
      
       int result = rService.reviewDelete(reviewId);
      
      
      return "ok";
      
   }
   
   @ResponseBody
   @RequestMapping("deleteReviewAtt.sp")
   public String deleteReviewAtt(String src, HttpServletRequest request) {
      
      int result = rService.deleteFileAtt(src, request);
      
      if(result>0) {
         return "ㅋㅋㅋㅋ";
      } else {
         return "ㅗㅗㅗㅗ";
      }
      
   }
   
   
   

}