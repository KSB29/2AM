package com.project.splace.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.splace.member.model.dao.MemberDao;
import com.project.splace.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	
	@Override
	public Member loginMember(Member mem) {
		Member loginUser =mDao.selectMember(mem);
	
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
}
