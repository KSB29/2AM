package com.project.splace.admin.model.vo;

public class TodayBook {
	private int time;
	private int count;
	private String id;
	
	public TodayBook() {}

	public TodayBook(int time, int count) {
		super();
		this.time = time;
		this.count = count;
	}
	public TodayBook(int time, int count, String id) {
		super();
		this.time = time;
		this.count = count;
		this.id = id;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "TodayBook [time=" + time + ", count=" + count + ", id=" + id + "]";
	}

	
	
}
