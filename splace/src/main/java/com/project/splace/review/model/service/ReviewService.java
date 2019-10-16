package com.project.splace.review.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.project.splace.book.model.vo.Book;
import com.project.splace.review.model.vo.Review;
import com.project.splace.review.model.vo.Review_ATT;

public interface ReviewService {

   /* public abstract */
   
   // 리뷰 등록 (글 + 별점 + 사진 )
   public abstract int insertReview(Review review, List<MultipartFile> files, HttpServletRequest request);

   
   // 리뷰 조회 (글 )
   public abstract ArrayList<Review> selectReview(int spaceId);

   // 리뷰 작성한 이용자가 있는지 카운트 
   public abstract int selectWriteBtn(Book book);

   // 리뷰 조회 (사진)
   public abstract ArrayList<Review_ATT> selectReviewImg(int reviewId);

   
   // 리뷰 수정 조회
   public abstract Review reviewUpdate(int reviewId);

   // 리뷰 수정 
   public abstract int reviewUpdateSubmit(Review review, List<MultipartFile> files, HttpServletRequest request);

   
   // 리뷰 삭제 
   public abstract int reviewDelete(int reviewId);


   // 리뷰사진삭제
   public abstract int deleteFileAtt(String src, HttpServletRequest request);

   


}