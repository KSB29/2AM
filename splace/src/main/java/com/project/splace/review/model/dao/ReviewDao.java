package com.project.splace.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.book.model.vo.Book;
import com.project.splace.review.model.vo.Review;
import com.project.splace.review.model.vo.Review_ATT;

@Repository("rDao")
public class ReviewDao {
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   /**
    * 리뷰 등록 
    * @param review
    * @return
    */
   public int insertReview(Review review) {
      
      return sqlSession.insert("reviewMapper.insertReview", review);
   }


   /** 리뷰 사진 등록
    * @param rAtt
    * @return
    */
   public int insertReviewFile(Review_ATT rAtt) {
      
      return sqlSession.insert("reviewMapper.insertReviewFile", rAtt);
   }

   public int selectReviewId() {
      return sqlSession.selectOne("reviewMapper.selectReviewId");
   }


   /** 리뷰 조회 (글 )
    * @param spaceId
    * @return
    */
   public ArrayList<Review> selectReview(int spaceId) {
      return (ArrayList)sqlSession.selectList("reviewMapper.selectReview", spaceId);
   }

 
   /** 리뷰 작성한 이용자가 있는지 카운트 
    * @param book
    * @return
    */
   public int selectWriteBtn(Book book) {
      return sqlSession.selectOne("reviewMapper.selectWriteBtn",book);
   }

   
   /** 리뷰 조회 (사진  )
    * @param reviewId 
    * @return
    */
   public ArrayList<Review_ATT> selectReviewImg(int reviewId) {
      return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewImg",reviewId);
   }


   /** 리뷰 수정 조회
    * @param reviewId
    * @return
    */
   public Review reviewUpdate(int reviewId) {
      return sqlSession.selectOne("reviewMapper.selectReviewUp", reviewId);
   }


   /**
    * 리뷰 게시글 수정 
    * @param reviewId
    * @return
    */
   public int reviewUpdateSubmit(Review review) {
      return sqlSession.update("reviewMapper.updateReview", review);
   }
   
   
   /**
    * 리뷰 사진 수정 
    * @param rAtt
    * @return
    */
   public int updateReviewFile(Review_ATT rAtt) {
      return sqlSession.update("reviewMapper.updateReviewImg", rAtt);
   }


   /**
    * 리뷰 삭제 
    * @param reviewId
    * @return
    */
   public int reviewDelete(int reviewId) {
      return sqlSession.update("reviewMapper.reviewDelete", reviewId);
   }


   /**
    * 리뷰파일삭제
    * @param reviewAttId
    */
   public int deleteReviewAtt(int reviewAttId) {
      return sqlSession.delete("reviewMapper.reviewAttDelete", reviewAttId);
   }

   /**
    * 리뷰파일삭제
    * @param reviewAttId
    */
   public int reviewAttDeleteSRC(String srcs) {
      return sqlSession.delete("reviewMapper.reviewAttDeleteSRC", srcs);
   }



}