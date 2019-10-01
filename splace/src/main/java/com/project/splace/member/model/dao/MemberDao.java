package com.project.splace.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public Member selectMember(Member mem) {
		Member loginUser = sqlSession.selectOne("memberMapper.selectOne", mem);
		return loginUser;
	}


	public int deleteMember(String memberId) {
		return sqlSession.delete("memberMapper.deleteMember",memberId);
		
	}
}