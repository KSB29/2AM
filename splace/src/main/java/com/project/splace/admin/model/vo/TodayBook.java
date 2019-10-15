package com.project.splace.admin.model.vo;

public class TodayBook {
	private int time;
	private int count;
	
	public TodayBook() {}

	public TodayBook(int time, int count) {
		super();
		this.time = time;
		this.count = count;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "TodayBook [time=" + time + ", count=" + count + "]";
	}
	
}
