package com.project.splace.admin.model.vo;

public class Sales {
	private int total; 
	private int recentlyThreeMonths;
	private String memberId;

	public Sales() {
	}
	public Sales(int total, int recentlyThreeMonths, String memberId) {
		super();
		this.total = total;
		this.recentlyThreeMonths = recentlyThreeMonths;
		this.memberId = memberId;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRecentlyThreeMonths() {
		return recentlyThreeMonths;
	}

	public void setRecentlyThreeMonths(int recentlyThreeMonths) {
		this.recentlyThreeMonths = recentlyThreeMonths;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	
	
	
	
	

}
