package com.project.splace.host.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.host.model.dao.HostDao;
import com.project.splace.host.model.vo.Host;

@Service("hService")
public class HostServiceImpl implements HostService {
	
	@Autowired
	private HostDao dHost;
	
	@Override
	public Host selectOne(String memberId) {
		return dHost.selectOne(memberId);
	}

	@Override
	public Host insertHost(Host host) {
		int result = dHost.insertHost(host);
		// 호스트 등록 완료 후 호스트 정보 리턴
		if (result > 0) return dHost.selectOne(host.getMemberId());
		else return null;
	}

	@Override
	public Host updateHost(Host host) {
		int result = dHost.updateHost(host);
		// 호스트 수정 완료 후 호스트 정보 리턴
		if (result > 0) return dHost.selectInfo(host.getHostId());
		else return null;
	}

	@Override
	public Host applyHost(int hostId) {
		int result = dHost.applyHost(hostId);
		// 호스트 신청 완료 후 호스트 정보 리턴
		if (result > 0) return dHost.selectInfo(hostId);
		else return null;
	}
	
}
