package com.project.splace.member.model.service;

import com.project.splace.member.model.vo.MailVO;
import com.project.splace.member.model.vo.Member;

public interface MemberService {
	
	public abstract Member loginMember(Member mem);
	
	public abstract Member loginSocialMember(String memberId);

	public abstract int insertMember(Member mem);
	
	public abstract int insertSocialMember(Member mem);
	
	public abstract int deleteMember(String memberId);

	public abstract int checkId(String memberId);

	public abstract Member checkPwd(Member mem);

	public abstract int updatePwd(Member mem);

	public abstract int updatePwd(MailVO vo);



	
	
	
}
