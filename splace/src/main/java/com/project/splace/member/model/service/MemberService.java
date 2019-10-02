package com.project.splace.member.model.service;

import com.project.splace.member.model.vo.Member;

public interface MemberService {
	
	public abstract Member loginMember(Member mem);

	public abstract int deleteMember(String memberId);

	public abstract int insertMember(Member mem);

	public abstract int checkId(String memberId);
	
	
	
}
