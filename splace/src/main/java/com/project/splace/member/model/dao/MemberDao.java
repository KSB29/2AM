package com.project.splace.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.member.model.vo.MailVO;
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


	public int insertMember(Member mem) {
		return sqlSession.insert("memberMapper.insertMember",mem);
	}


	public int checkId(String memberId) {
		return sqlSession.selectOne("memberMapper.checkId",memberId);
	}


	public Member selectPwd(Member mem) {
		Member checkPwd = sqlSession.selectOne("memberMapper.checkPwd", mem);
		return checkPwd;
	}


	public int updatePwd(Member mem) {
		return sqlSession.update("memberMapper.changePwd", mem);
	}


	/** 임시 비밀번호 저장용 DAO
	 * @param vo
	 * @return result
	 */
	public int updatePwd(MailVO vo) {
		return sqlSession.update("memberMapper.findPwd", vo);
	}


	public int insertSocialMember(Member mem) {
		return sqlSession.insert("memberMapper.insertSocialMember", mem);
	}


	public Member loginSocialMember(String memberId) {
		
		Member loginUser = sqlSession.selectOne("memberMapper.selectSocialId", memberId);
		return loginUser;
	}




}