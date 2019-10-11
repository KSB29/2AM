package com.project.splace.host.model.vo;

public class HostSearch {
	
	private String spaceId;
	private String statusId;
	private int hostId;
	
	public HostSearch() {}

	public HostSearch(String spaceId, String statusId, int hostId) {
		super();
		this.spaceId = spaceId;
		this.statusId = statusId;
		this.hostId = hostId;
	}

	public String getSpaceId() {
		return spaceId;
	}

	public void setSpaceId(String spaceId) {
		this.spaceId = spaceId;
	}

	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

	public int getHostId() {
		return hostId;
	}

	public void setHostId(int hostId) {
		this.hostId = hostId;
	}

	@Override
	public String toString() {
		return "HostSearch [spaceId=" + spaceId + ", statusId=" + statusId + ", hostId=" + hostId + "]";
	}
	
}
