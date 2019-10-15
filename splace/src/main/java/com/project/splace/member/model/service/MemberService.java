package com.project.splace.member.model.service;

import java.util.ArrayList;

import com.project.splace.member.model.vo.MailVO;
import com.project.splace.member.model.vo.Member;
import com.project.splace.member.model.vo.WishListVO;
import com.project.splace.space.model.vo.WishList;

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

	public abstract ArrayList<WishListVO> selectWishList(String memberId);

	public abstract int updatePhone(Member mem);



	
	
	
}
