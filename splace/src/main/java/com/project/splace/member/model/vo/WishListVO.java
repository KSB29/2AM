package com.project.splace.member.model.vo;

public class WishListVO {
	private String memberId;
	private int spaceId;
	private String spaceTag;
	private String spaceName;
	private String spaceOpenTime;
	private String spaceCloseTime;
	private String spaceAddress;
	private int spaceMaxPer;
	private int spaceTime;
	private String priceTime;
	private String spaceAttChange;
	
	public WishListVO() {}
	
	public WishListVO(String memberId, int spaceId) {
		super();
		this.spaceId = spaceId;
	}
	

	public WishListVO( int spaceId, String spaceTag, String spaceName, String spaceOpenTime,
			String spaceCloseTime, String spaceAddress, int spaceMaxPer, int spaceTime, String priceTime,
			String spaceAttChange) {
		super();
		this.spaceId = spaceId;
		this.spaceTag = spaceTag;
		this.spaceName = spaceName;
		this.spaceOpenTime = spaceOpenTime;
		this.spaceCloseTime = spaceCloseTime;
		this.spaceAddress = spaceAddress;
		this.spaceMaxPer = spaceMaxPer;
		this.spaceTime = spaceTime;
		this.priceTime = priceTime;
		this.spaceAttChange = spaceAttChange;
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


	public String getSpaceTag() {
		return spaceTag;
	}


	public void setSpaceTag(String spaceTag) {
		this.spaceTag = spaceTag;
	}


	public String getSpaceName() {
		return spaceName;
	}


	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}


	public String getSpaceOpenTime() {
		return spaceOpenTime;
	}


	public void setSpaceOpenTime(String spaceOpenTime) {
		this.spaceOpenTime = spaceOpenTime;
	}


	public String getSpaceCloseTime() {
		return spaceCloseTime;
	}


	public void setSpaceCloseTime(String spaceCloseTime) {
		this.spaceCloseTime = spaceCloseTime;
	}


	public String getSpaceAddress() {
		return spaceAddress;
	}


	public void setSpaceAddress(String spaceAddress) {
		this.spaceAddress = spaceAddress;
	}


	public int getSpaceMaxPer() {
		return spaceMaxPer;
	}


	public void setSpaceMaxPer(int spaceMaxPer) {
		this.spaceMaxPer = spaceMaxPer;
	}


	public int getSpaceTime() {
		return spaceTime;
	}


	public void setSpaceTime(int spaceTime) {
		this.spaceTime = spaceTime;
	}


	public String getPriceTime() {
		return priceTime;
	}


	public void setPriceTime(String priceTime) {
		this.priceTime = priceTime;
	}

	public String getSpaceAttChange() {
		return spaceAttChange;
	}

	public void setSpaceAttChange(String spaceAttChange) {
		this.spaceAttChange = spaceAttChange;
	}

	@Override
	public String toString() {
		return "WishListVO [ spaceId=" + spaceId + ", spaceTag=" + spaceTag + ", spaceName="
				+ spaceName + ", spaceOpenTime=" + spaceOpenTime + ", spaceCloseTime=" + spaceCloseTime
				+ ", spaceAddress=" + spaceAddress + ", spaceMaxPer=" + spaceMaxPer + ", spaceTime=" + spaceTime
				+ ", priceTime=" + priceTime + ", spaceAttChange=" + spaceAttChange + "]";
	}
	
	
	
	
}
