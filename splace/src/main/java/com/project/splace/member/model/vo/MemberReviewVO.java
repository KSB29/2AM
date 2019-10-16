package com.project.splace.member.model.vo;

import java.sql.Date;

public class MemberReviewVO {
	
	private int reviewId;
	private String spaceName;
	private int reviewScore;
	private String reviewContent;
	private Date reviewEnroll;
	private String reviewStatus;
	private String spaceAttChange;
	

	public MemberReviewVO() {}

	public MemberReviewVO(int reviewId, String spaceName, int reviewScore, String reviewContent, Date reviewEnroll,
			String reviewStatus, String spaceAttChange) {
		super();
		this.reviewId = reviewId;
		this.spaceName = spaceName;
		this.reviewScore = reviewScore;
		this.reviewContent = reviewContent;
		this.reviewEnroll = reviewEnroll;
		this.reviewStatus = reviewStatus;
		this.spaceAttChange = spaceAttChange;
	}




	public int getReviewId() {
		return reviewId;
	}


	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	
		
	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public int getReviewScore() {
		return reviewScore;
	}


	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public Date getReviewEnroll() {
		return reviewEnroll;
	}


	public void setReviewEnroll(Date reviewEnroll) {
		this.reviewEnroll = reviewEnroll;
	}


	public String getReviewStatus() {
		return reviewStatus;
	}


	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}


	public String getSpaceAttChange() {
		return spaceAttChange;
	}


	public void setSpaceAttChange(String spaceAttChange) {
		this.spaceAttChange = spaceAttChange;
	}



	
	
	
	
	
}
