package com.project.splace.member.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.splace.member.controller.MemberController;
import com.project.splace.member.model.dao.MemberDao;
import com.project.splace.member.model.vo.Member;

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
		logger.info("입력 비밃번호 :"+mem.getMemberPwd());
		logger.info("암호화된 비밀번호 :"+loginUser.getMemberPwd());
		
//		잠깐만 풀어놓을게요!
//		if(!bCryptPasswordEncoder.matches(mem.getMemberPwd(), loginUser.getMemberPwd())) {
//			loginUser =null;
//		}
		return loginUser;
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
}
