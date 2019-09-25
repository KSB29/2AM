package com.project.splace.host.model.vo;

import java.sql.Date;

public class Host {
	
	private int hostId;
	private String hostPhone;
	private String hostEmail;
	private String hostName;
	private String storeName;
	private String hostNo;
	private String hostBank;
	private String hostAccount;
	private String hostBname;
	private Date hostEnroll;
	private Date hostUpdate;
	private String memberId;
	private int statusId;
	
	public Host() {}

	public Host(int hostId, String hostPhone, String hostEmail, String hostName, String storeName, String hostNo,
			String hostBank, String hostAccount, String hostBname, Date hostEnroll, Date hostUpdate, String memberId,
			int statusId) {
		super();
		this.hostId = hostId;
		this.hostPhone = hostPhone;
		this.hostEmail = hostEmail;
		this.hostName = hostName;
		this.storeName = storeName;
		this.hostNo = hostNo;
		this.hostBank = hostBank;
		this.hostAccount = hostAccount;
		this.hostBname = hostBname;
		this.hostEnroll = hostEnroll;
		this.hostUpdate = hostUpdate;
		this.memberId = memberId;
		this.statusId = statusId;
	}

	public int getHostId() {
		return hostId;
	}

	public void setHostId(int hostId) {
		this.hostId = hostId;
	}

	public String getHostPhone() {
		return hostPhone;
	}

	public void setHostPhone(String hostPhone) {
		this.hostPhone = hostPhone;
	}

	public String getHostEmail() {
		return hostEmail;
	}

	public void setHostEmail(String hostEmail) {
		this.hostEmail = hostEmail;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getHostNo() {
		return hostNo;
	}

	public void setHostNo(String hostNo) {
		this.hostNo = hostNo;
	}

	public String getHostBank() {
		return hostBank;
	}

	public void setHostBank(String hostBank) {
		this.hostBank = hostBank;
	}

	public String getHostAccount() {
		return hostAccount;
	}

	public void setHostAccount(String hostAccount) {
		this.hostAccount = hostAccount;
	}

	public String getHostBname() {
		return hostBname;
	}

	public void setHostBname(String hostBname) {
		this.hostBname = hostBname;
	}

	public Date getHostEnroll() {
		return hostEnroll;
	}

	public void setHostEnroll(Date hostEnroll) {
		this.hostEnroll = hostEnroll;
	}

	public Date getHostUpdate() {
		return hostUpdate;
	}

	public void setHostUpdate(Date hostUpdate) {
		this.hostUpdate = hostUpdate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	@Override
	public String toString() {
		return "Host [hostId=" + hostId + ", hostPhone=" + hostPhone + ", hostEmail=" + hostEmail + ", hostName="
				+ hostName + ", storeName=" + storeName + ", hostNo=" + hostNo + ", hostBank=" + hostBank
				+ ", hostAccount=" + hostAccount + ", hostBname=" + hostBname + ", hostEnroll=" + hostEnroll
				+ ", hostUpdate=" + hostUpdate + ", memberId=" + memberId + ", statusId=" + statusId + "]";
	}

}
