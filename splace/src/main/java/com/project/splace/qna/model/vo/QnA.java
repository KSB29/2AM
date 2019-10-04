package com.project.splace.qna.model.vo;

import java.sql.Date;

public class QnA {
	private int qnaId;
	private String qContent;
	private Date qDate;
	private String aContent;
	private Date aDate;
	private String qType;
	private String qStatus;
	private String qMemberId;
	private String MemberId;
	private String spaceId;
	
	public QnA() {}

	public QnA(int qnaId, String qContent, Date qDate, String aContent, Date aDate, String qType, String qStatus,
			String qMemberId, String memberId, String spaceId) {
		super();
		this.qnaId = qnaId;
		this.qContent = qContent;
		this.qDate = qDate;
		this.aContent = aContent;
		this.aDate = aDate;
		this.qType = qType;
		this.qStatus = qStatus;
		this.qMemberId = qMemberId;
		MemberId = memberId;
		this.spaceId = spaceId;
	}

	public int getQnaId() {
		return qnaId;
	}

	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getqType() {
		return qType;
	}

	public void setqType(String qType) {
		this.qType = qType;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	public String getqMemberId() {
		return qMemberId;
	}

	public void setqMemberId(String qMemberId) {
		this.qMemberId = qMemberId;
	}

	public String getMemberId() {
		return MemberId;
	}

	public void setMemberId(String memberId) {
		MemberId = memberId;
	}

	public String getSpaceId() {
		return spaceId;
	}

	public void setSpaceId(String spaceId) {
		this.spaceId = spaceId;
	}

	@Override
	public String toString() {
		return "QnA [qnaId=" + qnaId + ", qContent=" + qContent + ", qDate=" + qDate + ", aContent=" + aContent
				+ ", aDate=" + aDate + ", qType=" + qType + ", qStatus=" + qStatus + ", qMemberId=" + qMemberId
				+ ", MemberId=" + MemberId + ", spaceId=" + spaceId + "]";
	}
	
	
	

}
