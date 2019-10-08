package com.project.splace.space.model.vo;

import org.springframework.stereotype.Component;

@Component
public class WishList {
	private String memberId;
	private int spaceId;
	
	public WishList() {
	}

	public WishList(String memberId, int spaceId) {
		super();
		this.memberId = memberId;
		this.spaceId = spaceId;
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

	@Override
	public String toString() {
		return "WishList [memberId=" + memberId + ", spaceId=" + spaceId + "]";
	}
	
}
