package com.project.splace.review.model.vo;

import java.sql.Date;

public class Review_ATT {
   private int reviewAttId;
   private String reviewAttOrigin;
   private String reviewAttChange;
   private String reviewAttFilepath;
   private Date reviewAttDate;
   private String reviewAttStatus;
   private int reviewId;
   private int spaceId;
   
   public Review_ATT() {}

   public Review_ATT(int reviewAttId, String reviewAttOrigin, String reviewAttChange, String reviewAttFilepath,
         Date reviewAttDate, String reviewAttStatus, int reviewId, int spaceId) {
      super();
      this.reviewAttId = reviewAttId;
      this.reviewAttOrigin = reviewAttOrigin;
      this.reviewAttChange = reviewAttChange;
      this.reviewAttFilepath = reviewAttFilepath;
      this.reviewAttDate = reviewAttDate;
      this.reviewAttStatus = reviewAttStatus;
      this.reviewId = reviewId;
      this.spaceId = spaceId;
   }

   public int getReviewAttId() {
      return reviewAttId;
   }

   public void setReviewAttId(int reviewAttId) {
      this.reviewAttId = reviewAttId;
   }

   public String getReviewAttOrigin() {
      return reviewAttOrigin;
   }

   public void setReviewAttOrigin(String reviewAttOrigin) {
      this.reviewAttOrigin = reviewAttOrigin;
   }

   public String getReviewAttChange() {
      return reviewAttChange;
   }

   public void setReviewAttChange(String reviewAttChange) {
      this.reviewAttChange = reviewAttChange;
   }

   public String getReviewAttFilepath() {
      return reviewAttFilepath;
   }

   public void setReviewAttFilepath(String reviewAttFilepath) {
      this.reviewAttFilepath = reviewAttFilepath;
   }

   public Date getReviewAttDate() {
      return reviewAttDate;
   }

   public void setReviewAttDate(Date reviewAttDate) {
      this.reviewAttDate = reviewAttDate;
   }

   public String getReviewAttStatus() {
      return reviewAttStatus;
   }

   public void setReviewAttStatus(String reviewAttStatus) {
      this.reviewAttStatus = reviewAttStatus;
   }

   public int getReviewId() {
      return reviewId;
   }

   public void setReviewId(int reviewId) {
      this.reviewId = reviewId;
   }

   public int getSpaceId() {
      return spaceId;
   }

   public void setSpaceId(int spaceId) {
      this.spaceId = spaceId;
   }

   @Override
   public String toString() {
      return "Review_ATT [reviewAttId=" + reviewAttId + ", reviewAttOrigin=" + reviewAttOrigin + ", reviewAttChange="
            + reviewAttChange + ", reviewAttFilepath=" + reviewAttFilepath + ", reviewAttDate=" + reviewAttDate
            + ", reviewAttStatus=" + reviewAttStatus + ", reviewId=" + reviewId + ", spaceId=" + spaceId + "]";
   }

   
   
   

}