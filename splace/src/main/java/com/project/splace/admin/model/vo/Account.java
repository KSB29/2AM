package com.project.splace.admin.model.vo;

import java.util.Date;

public class Account {
	private int accountId;
	private Date accountStart;
	private Date accountEnd;
	private int accountTotal;
	private int accountFee;
	private int accountPrice;
	private int hoshId;
	
	public Account() {}

	public Account(int accountId, Date accountStart, Date accountEnd, int accountTotal, int accountFee,
			int accountPrice, int hoshId) {
		super();
		this.accountId = accountId;
		this.accountStart = accountStart;
		this.accountEnd = accountEnd;
		this.accountTotal = accountTotal;
		this.accountFee = accountFee;
		this.accountPrice = accountPrice;
		this.hoshId = hoshId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public Date getAccountStart() {
		return accountStart;
	}

	public void setAccountStart(Date accountStart) {
		this.accountStart = accountStart;
	}

	public Date getAccountEnd() {
		return accountEnd;
	}

	public void setAccountEnd(Date accountEnd) {
		this.accountEnd = accountEnd;
	}

	public int getAccountTotal() {
		return accountTotal;
	}

	public void setAccountTotal(int accountTotal) {
		this.accountTotal = accountTotal;
	}

	public int getAccountFee() {
		return accountFee;
	}

	public void setAccountFee(int accountFee) {
		this.accountFee = accountFee;
	}

	public int getAccountPrice() {
		return accountPrice;
	}

	public void setAccountPrice(int accountPrice) {
		this.accountPrice = accountPrice;
	}

	public int getHoshId() {
		return hoshId;
	}

	public void setHoshId(int hoshId) {
		this.hoshId = hoshId;
	}

	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", accountStart=" + accountStart + ", accountEnd=" + accountEnd
				+ ", accountTotal=" + accountTotal + ", accountFee=" + accountFee + ", accountPrice=" + accountPrice
				+ ", hoshId=" + hoshId + "]";
	}
	
	
}
