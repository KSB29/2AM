package com.project.splace.space.model.vo;

import java.sql.Date;

public class SpaceAtt {
	
	private int spaceAttId;
	private String spaceAttOrigin;
	private String spaceAttChange;
	private String spaceAttFilepath;
	private Date spaceAttDate;
	private String spaceAttType;
	private String spaceAttStatus;
	private int spaceId;
	
	public SpaceAtt() {}

	public SpaceAtt(int spaceAttId, String spaceAttOrigin, String spaceAttChange, String spaceAttFilepath,
			Date spaceAttDate, String spaceAttType, String spaceAttStatus, int spaceId) {
		super();
		this.spaceAttId = spaceAttId;
		this.spaceAttOrigin = spaceAttOrigin;
		this.spaceAttChange = spaceAttChange;
		this.spaceAttFilepath = spaceAttFilepath;
		this.spaceAttDate = spaceAttDate;
		this.spaceAttType = spaceAttType;
		this.spaceAttStatus = spaceAttStatus;
		this.spaceId = spaceId;
	}

	public int getSpaceAttId() {
		return spaceAttId;
	}

	public void setSpaceAttId(int spaceAttId) {
		this.spaceAttId = spaceAttId;
	}

	public String getSpaceAttOrigin() {
		return spaceAttOrigin;
	}

	public void setSpaceAttOrigin(String spaceAttOrigin) {
		this.spaceAttOrigin = spaceAttOrigin;
	}

	public String getSpaceAttChange() {
		return spaceAttChange;
	}

	public void setSpaceAttChange(String spaceAttChange) {
		this.spaceAttChange = spaceAttChange;
	}

	public String getSpaceAttFilepath() {
		return spaceAttFilepath;
	}

	public void setSpaceAttFilepath(String spaceAttFilepath) {
		this.spaceAttFilepath = spaceAttFilepath;
	}

	public Date getSpaceAttDate() {
		return spaceAttDate;
	}

	public void setSpaceAttDate(Date spaceAttDate) {
		this.spaceAttDate = spaceAttDate;
	}

	public String getSpaceAttType() {
		return spaceAttType;
	}

	public void setSpaceAttType(String spaceAttType) {
		this.spaceAttType = spaceAttType;
	}

	public String getSpaceAttStatus() {
		return spaceAttStatus;
	}

	public void setSpaceAttStatus(String spaceAttStatus) {
		this.spaceAttStatus = spaceAttStatus;
	}

	public int getSpaceId() {
		return spaceId;
	}

	public void setSpaceId(int spaceId) {
		this.spaceId = spaceId;
	}

	@Override
	public String toString() {
		return "SpaceAtt [spaceAttId=" + spaceAttId + ", spaceAttOrigin=" + spaceAttOrigin + ", spaceAttChange="
				+ spaceAttChange + ", spaceAttFilepath=" + spaceAttFilepath + ", spaceAttDate=" + spaceAttDate
				+ ", spaceAttType=" + spaceAttType + ", spaceAttStatus=" + spaceAttStatus + ", spaceId=" + spaceId
				+ "]";
	}

}
