package com.project.splace.review.model.vo;

import java.sql.Date;

public class Review {

	private int reviewId;
	private int reviewScore;
	private String reviewContent;
	private Date reviewEnroll;
	private Date reviewUpdate;	
	private String reviewStatus;
	private String memberId;
	private int spaceId;
	private String bookId;
	private String memberName;
	private String spaceName;
	private String attInfo;
	
	public Review() {}

	public Review(int reviewId, int reviewScore, String reviewContent, Date reviewEnroll, Date reviewUpdate,
			String reviewStatus, String memberId, int spaceId, String bookId) {
		super();
		this.reviewId = reviewId;
		this.reviewScore = reviewScore;
		this.reviewContent = reviewContent;
		this.reviewEnroll = reviewEnroll;
		this.reviewUpdate = reviewUpdate;
		this.reviewStatus = reviewStatus;
		this.memberId = memberId;
		this.spaceId = spaceId;
		this.bookId = bookId;
	}

	public Review(int reviewId, int reviewScore, String reviewContent, Date reviewEnroll, Date reviewUpdate,
			String reviewStatus, String memberId, int spaceId, String bookId, String memberName, String spaceName, String attInfo) {
		super();
		this.reviewId = reviewId;
		this.reviewScore = reviewScore;
		this.reviewContent = reviewContent;
		this.reviewEnroll = reviewEnroll;
		this.reviewUpdate = reviewUpdate;
		this.reviewStatus = reviewStatus;
		this.memberId = memberId;
		this.spaceId = spaceId;
		this.bookId = bookId;
		this.memberName = memberName;
		this.spaceName = spaceName;
		this.attInfo = attInfo;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
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

	public Date getReviewUpdate() {
		return reviewUpdate;
	}

	public void setReviewUpdate(Date reviewUpdate) {
		this.reviewUpdate = reviewUpdate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getSpaceId() {
		return spaceId;
	}

	public void setSpaceId(int spaceId) {
		this.spaceId = spaceId;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public String getAttInfo() {
		return attInfo;
	}

	public void setAttInfo(String attInfo) {
		this.attInfo = attInfo;
	}

	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", reviewScore=" + reviewScore + ", reviewContent=" + reviewContent
				+ ", reviewEnroll=" + reviewEnroll + ", reviewUpdate=" + reviewUpdate + ", reviewStatus=" + reviewStatus
				+ ", memberId=" + memberId + ", spaceId=" + spaceId + "]";
	}
	
	
	
}