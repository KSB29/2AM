package com.project.splace.space.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Price {
	
	private int priceId;
	private String priceWeekend;
	private String priceTime;
	private int spaceId;
	private int spaceOpenTime;
	private int spaceCloseTime;
	private int spaceAdd;
	
	public Price() {}

	public Price(int priceId, String priceWeekend, String priceTime, int spaceId) {
		super();
		this.priceId = priceId;
		this.priceWeekend = priceWeekend;
		this.priceTime = priceTime;
		this.spaceId = spaceId;
	}

	public Price(int priceId, String priceWeekend, String priceTime, int spaceId, int spaceOpenTime, int spaceCloseTime,
			int spaceAdd) {
		super();
		this.priceId = priceId;
		this.priceWeekend = priceWeekend;
		this.priceTime = priceTime;
		this.spaceId = spaceId;
		this.spaceOpenTime = spaceOpenTime;
		this.spaceCloseTime = spaceCloseTime;
		this.spaceAdd = spaceAdd;
	}

	public int getPriceId() {
		return priceId;
	}

	public void setPriceId(int priceId) {
		this.priceId = priceId;
	}

	public String getPriceWeekend() {
		return priceWeekend;
	}

	public void setPriceWeekend(String priceWeekend) {
		this.priceWeekend = priceWeekend;
	}

	public String getPriceTime() {
		return priceTime;
	}

	public void setPriceTime(String priceTime) {
		this.priceTime = priceTime;
	}

	public int getSpaceId() {
		return spaceId;
	}

	public void setSpaceId(int spaceId) {
		this.spaceId = spaceId;
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

	public int getSpaceAdd() {
		return spaceAdd;
	}

	public void setSpaceAdd(int spaceAdd) {
		this.spaceAdd = spaceAdd;
	}

	@Override
	public String toString() {
		return "Price [priceId=" + priceId + ", priceWeekend=" + priceWeekend + ", priceTime=" + priceTime
				+ ", spaceId=" + spaceId + "]";
	}

}
