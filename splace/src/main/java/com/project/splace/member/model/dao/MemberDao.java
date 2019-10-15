package com.project.splace.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.common.PageInfo;
import com.project.splace.member.model.vo.MailVO;
import com.project.splace.member.model.vo.Member;
import com.project.splace.member.model.vo.MemberQnaVO;
import com.project.splace.member.model.vo.MemberReviewVO;
import com.project.splace.member.model.vo.WishListVO;

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



	public ArrayList<WishListVO> selectWishList(String memberId) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectWishList", memberId);
	}


	public int updatePhone(Member mem) {
		return sqlSession.update("memberMapper.updatePhone", mem);
	}


	/**
	 * 후기 리스트 조회 DAO
	 * @param memberId
	 * @return
	 */
	public ArrayList<MemberReviewVO> selectReviewList( PageInfo pageInfo, String memberId) {
		int offset = (pageInfo.getCurrentPage()- 1) * pageInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectReviewList",memberId, rowBounds);
	}


	/**
	 * 후기 리스트 수 조회 DAO
	 * @param membeId
	 * @return
	 */
	public int getrListCount(String membeId)  {
		return sqlSession.selectOne("memberMapper.memberListCount");
		
	}


	public int deleteWishList(WishListVO wish)throws Exception {
		return sqlSession.delete("memberMapper.delteWishList", wish);
	}

	public ArrayList<MemberQnaVO> selectQnaList(PageInfo pageInfo, String memberId) {
		int offset = (pageInfo.getCurrentPage()- 1) * pageInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectReviewList",memberId, rowBounds);
	}


	public int getqListCount(String memberId) {
		return sqlSession.selectOne("memberMapper.memberQListCount");
	}




}