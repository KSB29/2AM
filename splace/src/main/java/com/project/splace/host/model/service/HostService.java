package com.project.splace.host.model.service;

import java.util.ArrayList;

import com.project.splace.host.model.vo.BookList;
import com.project.splace.host.model.vo.Host;
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
	 * @param hostId
	 * @param currentPage
	 * @return bList
	 */
	public abstract ArrayList<BookList> selectBookList(int hostId, int currentPage);

	/**
	 * 호스트의 공간 리스트 Service
	 * @param hostId
	 * @return sList
	 */
	public abstract ArrayList<Space> selectSpaceList(int hostId);
	
}
