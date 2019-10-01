package com.project.splace.space.model.vo;

import java.sql.Date;

public class Space {
	
	private int spaceId;
	private String spaceName;
	private String spaceComment;
	private String spaceDetail;
	private String spaceTag;
	private String spaceOption;
	private String spaceAddress;
	private String spaceNotice;
	private String spaceOperStatus;
	private int spaceTime;
	private int spaceMinPer;
	private int spaceMaxPer;
	private int spaceAdd;
	private int spaceOpenTime;
	private int spaceCloseTime;
	private int hostId;
	private int typeId;
	private int statusId;
	private Date spaceEnroll;
	private Date spaceUpdate;
	private String memberId;
	private String spaceAttChange;
	
	public Space() {}

	public Space(int spaceId, String spaceName, String spaceComment, String spaceDetail, String spaceTag,
			String spaceOption, String spaceAddress, String spaceNotice, String spaceOperStatus, int spaceTime,
			int spaceMinPer, int spaceMaxPer, int spaceAdd, int spaceOpenTime, int spaceCloseTime, int hostId,
			int typeId, int statusId, Date spaceEnroll, Date spaceUpdate) {
		super();
		this.spaceId = spaceId;
		this.spaceName = spaceName;
		this.spaceComment = spaceComment;
		this.spaceDetail = spaceDetail;
		this.spaceTag = spaceTag;
		this.spaceOption = spaceOption;
		this.spaceAddress = spaceAddress;
		this.spaceNotice = spaceNotice;
		this.spaceOperStatus = spaceOperStatus;
		this.spaceTime = spaceTime;
		this.spaceMinPer = spaceMinPer;
		this.spaceMaxPer = spaceMaxPer;
		this.spaceAdd = spaceAdd;
		this.spaceOpenTime = spaceOpenTime;
		this.spaceCloseTime = spaceCloseTime;
		this.hostId = hostId;
		this.typeId = typeId;
		this.statusId = statusId;
		this.spaceEnroll = spaceEnroll;
		this.spaceUpdate = spaceUpdate;
	}
	
	public Space(int spaceId, String spaceName, String spaceComment, String spaceDetail, String spaceTag,
			String spaceOption, String spaceAddress, String spaceNotice, String spaceOperStatus, int spaceTime,
			int spaceMinPer, int spaceMaxPer, int spaceAdd, int spaceOpenTime, int spaceCloseTime, int hostId,
			int typeId, int statusId, Date spaceEnroll, Date spaceUpdate, String memberId, String spaceAttChange) {
		super();
		this.spaceId = spaceId;
		this.spaceName = spaceName;
		this.spaceComment = spaceComment;
		this.spaceDetail = spaceDetail;
		this.spaceTag = spaceTag;
		this.spaceOption = spaceOption;
		this.spaceAddress = spaceAddress;
		this.spaceNotice = spaceNotice;
		this.spaceOperStatus = spaceOperStatus;
		this.spaceTime = spaceTime;
		this.spaceMinPer = spaceMinPer;
		this.spaceMaxPer = spaceMaxPer;
		this.spaceAdd = spaceAdd;
		this.spaceOpenTime = spaceOpenTime;
		this.spaceCloseTime = spaceCloseTime;
		this.hostId = hostId;
		this.typeId = typeId;
		this.statusId = statusId;
		this.spaceEnroll = spaceEnroll;
		this.spaceUpdate = spaceUpdate;
		this.memberId = memberId;
		this.spaceAttChange = spaceAttChange;
	}

	public Space(int spaceId, String spaceName, String spaceComment, String spaceDetail, String spaceTag,
			String spaceOption, String spaceAddress, String spaceNotice, String spaceOperStatus, int spaceTime,
			int spaceMinPer, int spaceMaxPer, int spaceAdd, int spaceOpenTime, int spaceCloseTime, int hostId,
			int typeId, int statusId, Date spaceEnroll, Date spaceUpdate, String spaceAttChange) {
		super();
		this.spaceId = spaceId;
		this.spaceName = spaceName;
		this.spaceComment = spaceComment;
		this.spaceDetail = spaceDetail;
		this.spaceTag = spaceTag;
		this.spaceOption = spaceOption;
		this.spaceAddress = spaceAddress;
		this.spaceNotice = spaceNotice;
		this.spaceOperStatus = spaceOperStatus;
		this.spaceTime = spaceTime;
		this.spaceMinPer = spaceMinPer;
		this.spaceMaxPer = spaceMaxPer;
		this.spaceAdd = spaceAdd;
		this.spaceOpenTime = spaceOpenTime;
		this.spaceCloseTime = spaceCloseTime;
		this.hostId = hostId;
		this.typeId = typeId;
		this.statusId = statusId;
		this.spaceEnroll = spaceEnroll;
		this.spaceUpdate = spaceUpdate;
		this.spaceAttChange = spaceAttChange;
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

	public String getSpaceComment() {
		return spaceComment;
	}

	public void setSpaceComment(String spaceComment) {
		this.spaceComment = spaceComment;
	}

	public String getSpaceDetail() {
		return spaceDetail;
	}

	public void setSpaceDetail(String spaceDetail) {
		this.spaceDetail = spaceDetail;
	}

	public String getSpaceTag() {
		return spaceTag;
	}

	public void setSpaceTag(String spaceTag) {
		this.spaceTag = spaceTag;
	}

	public String getSpaceOption() {
		return spaceOption;
	}

	public void setSpaceOption(String spaceOption) {
		this.spaceOption = spaceOption;
	}

	public String getSpaceAddress() {
		return spaceAddress;
	}

	public void setSpaceAddress(String spaceAddress) {
		this.spaceAddress = spaceAddress;
	}

	public String getSpaceNotice() {
		return spaceNotice;
	}

	public void setSpaceNotice(String spaceNotice) {
		this.spaceNotice = spaceNotice;
	}

	public String getSpaceOperStatus() {
		return spaceOperStatus;
	}

	public void setSpaceOperStatus(String spaceOperStatus) {
		this.spaceOperStatus = spaceOperStatus;
	}

	public int getSpaceTime() {
		return spaceTime;
	}

	public void setSpaceTime(int spaceTime) {
		this.spaceTime = spaceTime;
	}

	public int getSpaceMinPer() {
		return spaceMinPer;
	}

	public void setSpaceMinPer(int spaceMinPer) {
		this.spaceMinPer = spaceMinPer;
	}

	public int getSpaceMaxPer() {
		return spaceMaxPer;
	}

	public void setSpaceMaxPer(int spaceMaxPer) {
		this.spaceMaxPer = spaceMaxPer;
	}

	public int getSpaceAdd() {
		return spaceAdd;
	}

	public void setSpaceAdd(int spaceAdd) {
		this.spaceAdd = spaceAdd;
	}

	public int getSpaceOpenTime() {
		return spaceOpenTime;
	}

	public void setSpaceOpenTime(int spaceOpenTime) {
		this.spaceOpenTime = spaceOpenTime;
	}

	public int getSpaceCloseTime() {
		return spaceCloseTime;
	}

	public void setSpaceCloseTime(int spaceCloseTime) {
		this.spaceCloseTime = spaceCloseTime;
	}

	public int getHostId() {
		return hostId;
	}

	public void setHostId(int hostId) {
		this.hostId = hostId;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public Date getSpaceEnroll() {
		return spaceEnroll;
	}

	public void setSpaceEnroll(Date spaceEnroll) {
		this.spaceEnroll = spaceEnroll;
	}

	public Date getSpaceUpdate() {
		return spaceUpdate;
	}

	public void setSpaceUpdate(Date spaceUpdate) {
		this.spaceUpdate = spaceUpdate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getSpaceAttChange() {
		return spaceAttChange;
	}

	public void setSpaceAttChange(String spaceAttChange) {
		this.spaceAttChange = spaceAttChange;
	}

	@Override
	public String toString() {
		return "Space [spaceId=" + spaceId + ", spaceName=" + spaceName + ", spaceComment=" + spaceComment
				+ ", spaceDetail=" + spaceDetail + ", spaceTag=" + spaceTag + ", spaceOption=" + spaceOption
				+ ", spaceAddress=" + spaceAddress + ", spaceNotice=" + spaceNotice + ", spaceOperStatus="
				+ spaceOperStatus + ", spaceTime=" + spaceTime + ", spaceMinPer=" + spaceMinPer + ", spaceMaxPer="
				+ spaceMaxPer + ", spaceAdd=" + spaceAdd + ", spaceOpenTime=" + spaceOpenTime + ", spaceCloseTime="
				+ spaceCloseTime + ", hostId=" + hostId + ", typeId=" + typeId + ", statusId=" + statusId + "]";
	}

}
