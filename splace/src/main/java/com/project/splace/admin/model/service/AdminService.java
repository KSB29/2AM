package com.project.splace.admin.model.service;

import java.util.ArrayList;

import com.project.splace.admin.model.vo.Account;
import com.project.splace.board.model.vo.Board;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;

public interface AdminService {

	// 정산관리
	public abstract ArrayList<Account> selectAccountList(int month);

	// 회원관리
	public abstract ArrayList<Member> selectMemberList(String memberStatus);

	// 호스트관리
	public abstract ArrayList<Host> selectHostList(int status);

	// faq관리
	public abstract ArrayList<Board> selectFaqList(int status);

	// 공지사항관리
	public abstract ArrayList<Board> selectNoticeList();

}
