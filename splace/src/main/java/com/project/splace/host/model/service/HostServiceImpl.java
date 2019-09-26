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
	public int insertHost(Host host) {
		// 전호번호 - 제거
		host.setHostPhone(host.getHostPhone().replace("-", ""));
		return dHost.insertHost(host);
	}

	@Override
	public int updateHost(Host host) {
		// 전호번호 - 제거
		host.setHostPhone(host.getHostPhone().replace("-", ""));
		return dHost.updateHost(host);
	}

	@Override
	public int applyHost(int hostId) {
		return dHost.applyHost(hostId);
	}
	
}
