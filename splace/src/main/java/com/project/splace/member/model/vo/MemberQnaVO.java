package com.project.splace.member.model.vo;

import java.sql.Date;

public class MemberQnaVO {
	
	private int qnaId;
	private String qContent;
	private Date qDate;
	private String aContent;
	private Date aDate;
	private String qType;
	private String qStatus;
	private String qMemberId;
	private String aMemberId;
	
	
	public MemberQnaVO() {}


	public MemberQnaVO(int qnaId, String qContent, Date qDate, String aContent, Date aDate, String qType,
			String qStatus, String qMemberId, String aMemberId, int spaceId) {
		super();
		this.qnaId = qnaId;
		this.qContent = qContent;
		this.qDate = qDate;
		this.aContent = aContent;
		this.aDate = aDate;
		this.qType = qType;
		this.qStatus = qStatus;
		this.qMemberId = qMemberId;
		this.aMemberId = aMemberId;
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


	public String getaMemberId() {
		return aMemberId;
	}


	public void setaMemberId(String aMemberId) {
		this.aMemberId = aMemberId;
	}




	@Override
	public String toString() {
		return "memberQnaVO [qnaId=" + qnaId + ", qContent=" + qContent + ", qDate=" + qDate + ", aContent=" + aContent
				+ ", aDate=" + aDate + ", qType=" + qType + ", qStatus=" + qStatus + ", qMemberId=" + qMemberId
				+ ", aMemberId=" + aMemberId+ "]";
	}
	
	
	
	
	
	

}
