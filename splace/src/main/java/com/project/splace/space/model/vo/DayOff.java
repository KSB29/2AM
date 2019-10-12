package com.project.splace.space.model.vo;

import java.util.Date;

public class DayOff {
	private int dayOffId;
	private Date dayOffStart;
	private Date dayOffEnd;
	private int spaceId;
	
	public DayOff() {
	}
	
	public DayOff(Date dayOffStart, Date dayOffEnd) {
		super();
		this.dayOffStart = dayOffStart;
		this.dayOffEnd = dayOffEnd;
	}

	public DayOff(int dayOffId, Date dayOffStart, Date dayOffEnd, int spaceId) {
		super();
		this.dayOffId = dayOffId;
		this.dayOffStart = dayOffStart;
		this.dayOffEnd = dayOffEnd;
		this.spaceId = spaceId;
	}

	public int getDayOffId() {
		return dayOffId;
	}

	public void setDayOffId(int dayOffId) {
		this.dayOffId = dayOffId;
	}

	public Date getDayOffStart() {
		return dayOffStart;
	}

	public void setDayOffStart(Date dayOffStart) {
		this.dayOffStart = dayOffStart;
	}

	public Date getDayOffEnd() {
		return dayOffEnd;
	}

	public void setDayOffEnd(Date dayOffEnd) {
		this.dayOffEnd = dayOffEnd;
	}

	public int getSpaceId() {
		return spaceId;
	}

	public void setSpaceId(int spaceId) {
		this.spaceId = spaceId;
	}

	@Override
	public String toString() {
		return "DayOff [dayOffId=" + dayOffId + ", dayOffStart=" + dayOffStart + ", dayOffEnd=" + dayOffEnd
				+ ", spaceId=" + spaceId + "]";
	}
	
	
}
