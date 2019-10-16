package com.project.splace.main.model.vo;

import java.util.Date;

public class Notice {
	private int noticeId;
	private String noticeContent;
	private Date noticeDate;
	private String noticeStatus;
	private String memberId;
	
	public Notice() {
	}

	
	public Notice(String noticeContent, Date noticeDate,int noticeId) {
		super();
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeId = noticeId;
	}


	public Notice(int noticeId, String noticeContent, Date noticeDate, String noticeStatus, String memberId) {
		super();
		this.noticeId = noticeId;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeStatus = noticeStatus;
		this.memberId = memberId;
	}


	public int getNoticeId() {
		return noticeId;
	}


	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public Date getNoticeDate() {
		return noticeDate;
	}


	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}


	public String getNoticeStatus() {
		return noticeStatus;
	}


	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
				+ ", noticeStatus=" + noticeStatus + ", memberId=" + memberId + "]";
	}
	
	
	
	

}
