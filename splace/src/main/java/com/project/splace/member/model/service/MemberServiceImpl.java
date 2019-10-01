package com.project.splace.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.member.model.dao.MemberDao;
import com.project.splace.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member loginMember(Member mem) {
		Member loginUser =mDao.selectMember(mem);
	
		return loginUser;
	}

	@Override
	public int deleteMember(String memberId) {
		
		return mDao.deleteMember(memberId);
	}
}
