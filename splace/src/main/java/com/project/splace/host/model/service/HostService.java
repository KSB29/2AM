package com.project.splace.host.model.service;

import com.project.splace.host.model.vo.Host;

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
	 * @return result
	 */
	public abstract int insertHost(Host host);

	/**
	 * 호스트 정보 수정 Service
	 * @param host
	 * @return result
	 */
	public abstract int updateHost(Host host);

	/**
	 * 호스트 승인 요청 Service
	 * @param hostId
	 * @param memberId
	 * @return result
	 */
	public abstract int applyHost(int hostId);
	
}