package com.project.splace.member.model.service;

import java.util.ArrayList;

import com.project.splace.member.model.vo.MailVO;
import com.project.splace.member.model.vo.Member;
import com.project.splace.member.model.vo.MemberQnaVO;
import com.project.splace.member.model.vo.MemberReviewVO;
import com.project.splace.member.model.vo.WishListVO;
import com.project.splace.qna.model.vo.QnA;

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

	public abstract ArrayList<MemberReviewVO> selectReviewList(String memberId, int currentPage);

	public abstract int deleteWishList(WishListVO wish) throws Exception;

	public abstract ArrayList<MemberQnaVO> selectQnaList(String memberId, int currentPage);

	public abstract int insertQna(MemberQnaVO qna);

	public abstract int updateMemberAgree(Member mem);
}
