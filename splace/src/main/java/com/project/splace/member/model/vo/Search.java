package com.project.splace.member.model.vo;

public class Search {
	
	private String memberId;
	private String filter;
	
	public Search() {}

	public Search(String memberId, String filter) {
		super();
		this.memberId = memberId;
		this.filter = filter;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	@Override
	public String toString() {
		return "Search [memberId=" + memberId + ", filter=" + filter + "]";
	}
	
	

}
