package com.project.splace.host.model.service;

import java.util.ArrayList;

import org.json.simple.JSONArray;

import com.project.splace.admin.model.vo.Account;
import com.project.splace.host.model.vo.BookList;
import com.project.splace.host.model.vo.Host;
import com.project.splace.host.model.vo.HostSearch;
import com.project.splace.qna.model.vo.QnA;
import com.project.splace.space.model.vo.Space;

public interface HostService {
	
	/**
	 * 호스트 정보 조회 Service
	 * @param memberId
	 * @return host
	 */
	public abstract Host selectOne(String memberId);

	/**
	 * 호스트 정보 등록 Service
	 * @param host
	 * @return hostInfo
	 */
	public abstract Host insertHost(Host host);

	/**
	 * 호스트 정보 수정 Service
	 * @param host
	 * @return hostInfo
	 */
	public abstract Host updateHost(Host host);

	/**
	 * 호스트 승인 요청 Service
	 * @param hostId
	 * @param memberId
	 * @return hostInfo
	 */
	public abstract Host updateApplyHost(int hostId);

	/**
	 * 예약리스트 조회 Service
	 * @param search
	 * @param currentPage
	 * @return bList
	 */
	public abstract ArrayList<BookList> selectBookList(HostSearch search, int currentPage);

	/**
	 * 호스트의 공간 리스트 Service
	 * @param hostId
	 * @return sList
	 */
	public abstract ArrayList<Space> selectSpaceList(int hostId);

	/**
	 * 공간 예약 승인 처리 Service
	 * @param bList
	 * @return result
	 */
	public abstract int updateApplyBook(String statusId, JSONArray jsonArr);

	/**
	 * 공간 문의 리스트 Service
	 * @param search
	 * @param currentPage
	 * @return qList
	 */
	public abstract ArrayList<QnA> selectQnaList(HostSearch search, int currentPage);

	/**
	 * 정산 리스트 Service
	 * @param hostId
	 * @param currentPage
	 * @return aList
	 */
	public abstract ArrayList<Account> selectAccountList(int hostId, int currentPage);

	/**
	 * 공간 문의 답변 Service
	 * @param qna
	 * @return result
	 */
	public abstract int updateAnswer(QnA qna);
	
}
