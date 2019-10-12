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
   private String aMemberId;
   private int spaceId;
	private String spaceName;
	private String qMemberName;
   
   public QnA() {}

   public QnA(int qnaId, String qContent, Date qDate, String aContent, Date aDate, String qType, String qStatus,
         String qMemberId, String aMemberId, int spaceId) {
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
      this.spaceId = spaceId;
   }
   
   

   public QnA(int qnaId, String qContent, Date qDate, String aContent, Date aDate, String qType, String qStatus,
		String qMemberId, String aMemberId, int spaceId, String spaceName, String qMemberName) {
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
	this.spaceId = spaceId;
	this.spaceName = spaceName;
	this.qMemberName = qMemberName;
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

   public int getSpaceId() {
      return spaceId;
   }

   public void setSpaceId(int spaceId) {
      this.spaceId = spaceId;
   }
   
   

   public String getSpaceName() {
	return spaceName;
}

public void setSpaceName(String spaceName) {
	this.spaceName = spaceName;
}

public String getqMemberName() {
	return qMemberName;
}

public void setqMemberName(String qMemberName) {
	this.qMemberName = qMemberName;
}

@Override
   public String toString() {
      return "QnA [qnaId=" + qnaId + ", qContent=" + qContent + ", qDate=" + qDate + ", aContent=" + aContent
            + ", aDate=" + aDate + ", qType=" + qType + ", qStatus=" + qStatus + ", qMemberId=" + qMemberId
            + ", aMemberId=" + aMemberId + ", spaceId=" + spaceId + "]";
   }

   
   
   

}