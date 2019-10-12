package com.project.splace.admin.model.service;

import java.util.ArrayList;

import com.project.splace.admin.model.vo.Account;
import com.project.splace.board.model.vo.Board;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;

public interface AdminService {

	// 정산관리
	ArrayList<Account> selectAccountList(int month);

	// 회원관리
	ArrayList<Member> selectMemberList(String memberStatus);

	// 호스트관리
	ArrayList<Host> selectHostList(int status);

	// faq관리
	ArrayList<Board> selectFaqList();

}
