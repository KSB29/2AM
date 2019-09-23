package com.project.splace.member.model.vo;

import java.util.Date;

public class Member {
	public String memberId;
	public String memberPwd;
	public String memberName;
	public String memberPhone;
	public String memberAgree;
	public Date memberEnroll;
	public Date memberUpdate;
	public String memberSocial;
	public String grade;
	public String memberStatus;

	public Member() {}

	public Member(String memberId, String memberPwd, String memberName, String memberPhone, String memberAgree,
			Date memberEnroll, Date memberUpdate, String memberSocial, String grade, String memberStatus) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAgree = memberAgree;
		this.memberEnroll = memberEnroll;
		this.memberUpdate = memberUpdate;
		this.memberSocial = memberSocial;
		this.grade = grade;
		this.memberStatus = memberStatus;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAgree() {
		return memberAgree;
	}

	public void setMemberAgree(String memberAgree) {
		this.memberAgree = memberAgree;
	}

	public Date getMemberEnroll() {
		return memberEnroll;
	}

	public void setMemberEnroll(Date memberEnroll) {
		this.memberEnroll = memberEnroll;
	}

	public Date getMemberUpdate() {
		return memberUpdate;
	}

	public void setMemberUpdate(Date memberUpdate) {
		this.memberUpdate = memberUpdate;
	}

	public String getMemberSocial() {
		return memberSocial;
	}

	public void setMemberSocial(String memberSocial) {
		this.memberSocial = memberSocial;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	
	@Override
	public String toString() {
		return "Member1 [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + ", memberAgree=" + memberAgree + ", memberEnroll=" + memberEnroll
				+ ", memberUpdate=" + memberUpdate + ", memberSocial=" + memberSocial + ", grade=" + grade
				+ ", memberStatus=" + memberStatus + "]";
	}
}
