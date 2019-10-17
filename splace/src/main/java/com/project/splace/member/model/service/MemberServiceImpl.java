package com.project.splace.member.model.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.splace.common.PageInfo;
import com.project.splace.common.Pagination;
import com.project.splace.member.controller.MemberController;
import com.project.splace.member.model.dao.MemberDao;
import com.project.splace.member.model.vo.MailVO;
import com.project.splace.member.model.vo.Member;
import com.project.splace.member.model.vo.MemberQnaVO;
import com.project.splace.member.model.vo.MemberReviewVO;
import com.project.splace.member.model.vo.WishListVO;
import com.project.splace.qna.model.vo.QnA;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public Member loginMember(Member mem) {
		
		Member loginUser =mDao.selectMember(mem);
		logger.info("입력 비밀번호 :"+mem.getMemberPwd());
		
		// ID가 등록되어있지 않은 경우
		/*
		if(loginUser==null) {
			return loginUser;
			
		}else if(!bCryptPasswordEncoder.matches(mem.getMemberPwd(), loginUser.getMemberPwd())) {
			logger.info("암호화된 비밀번호 :"+loginUser.getMemberPwd());
			loginUser=null;
		}*/
		
		return loginUser;
		
	}
	
	@Override
	public Member loginSocialMember(String memberId) {
		return mDao.loginSocialMember(memberId);
	}

	@Override
	public int deleteMember(String memberId) {
		return mDao.deleteMember(memberId);
	}

	@Override
	public int insertMember(Member mem) {
		
		String encPwd = bCryptPasswordEncoder.encode(mem.getMemberPwd());
		mem.setMemberPwd(encPwd);
		return mDao.insertMember(mem);
		
	}

	@Override
	public int checkId(String memberId) {
		
		return mDao.checkId(memberId);
	}

	@Override
	public Member checkPwd(Member mem) {
		Member checkPwd =mDao.selectPwd(mem);
		if(!bCryptPasswordEncoder.matches( mem.memberPwd, checkPwd.getMemberPwd())) {
			checkPwd = null;
		}
		
		return checkPwd;
	}

	@Override
	public int updatePwd(Member mem) {
		String encPwd = bCryptPasswordEncoder.encode(mem.getMemberPwd());
		mem.setMemberPwd(encPwd);
		return mDao.updatePwd(mem);
	}

	@Override
	public int updatePwd(MailVO vo) {
		String encPwd = bCryptPasswordEncoder.encode(vo.getTemp());
		vo.setTemp(encPwd);
		return mDao.updatePwd(vo);

	}

	@Override
	public int insertSocialMember(Member mem) {
		return mDao.insertSocialMember(mem);
	}



	@Override
	public ArrayList<WishListVO> selectWishList(String memberId) {
		return mDao.selectWishList(memberId);
	}

	@Override
	public int updatePhone(Member mem) {
		return mDao.updatePhone(mem);
	}

	@Override
	public ArrayList<MemberReviewVO> selectReviewList(String memberId, int currentPage) {
		// 후기 리스트 수 조회
		int listCount = mDao.getrListCount(memberId);
		// 후기 리스트 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount);	
		ArrayList<MemberReviewVO> rList = mDao.selectReviewList(pageInfo, memberId);
		return rList;
	}

	@Override
	public int deleteWishList(WishListVO wish) throws Exception {
		return mDao.deleteWishList(wish);
	}

	@Override
	public ArrayList<MemberQnaVO> selectQnaList(String memberId, int currentPage) {
		// 후기 리스트 수 조회
		int listCount = mDao.getqListCount(memberId);
		// 후기 리스트 조회
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount);	
		ArrayList<MemberQnaVO> qList = mDao.selectQnaList(pageInfo, memberId);
		return qList;
		
		
		
	}

	@Override
	public int insertQna(MemberQnaVO qna) {
		return mDao.insertQna(qna);
	}
	
	
	// 광고성 수신동의 메일 여부 변경
	@Override
	public int updateMemberAgree(Member mem) {
		return mDao.updateMemberAgree(mem);
	}




}
