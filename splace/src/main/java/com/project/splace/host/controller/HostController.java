package com.project.splace.host.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.splace.host.model.service.HostService;
import com.project.splace.host.model.vo.Host;

@Controller
public class HostController {
	
	@Autowired
	private HostService hService;
	
	@RequestMapping("hostApplyForm.sp")
	public String hostApplyForm(String memberId, Model model, HttpServletRequest request) {
		Host hostInfo = hService.selectOne(memberId);
		if (hostInfo != null) model.addAttribute("host", hostInfo);
		return "host/hostApplyForm";
	}
	
	@RequestMapping("hostInsert.sp")
	public String hostInsert(Host host, Model model) {
		int result = hService.insertHost(host);
		if (result > 0) {
			Host hostInfo = hService.selectOne(host.getMemberId());
			if (hostInfo != null) model.addAttribute("host", hostInfo);
			return "host/hostApplyForm";
		} else {
			model.addAttribute("msg", "호스트 등록 오류 발생");
			return "host/hostApplyForm";
		}
	}
	
	@RequestMapping("hostUpdate.sp")
	public String hostUpdate(Host host, Model model) {
		int result = hService.updateHost(host);
		if (result > 0) {
			Host hostInfo = hService.selectOne(host.getMemberId());
			if (hostInfo != null) model.addAttribute("host", hostInfo);
			return "host/hostApplyForm";
		} else {
			model.addAttribute("msg", "호스트 등록 오류 발생");
			return "host/hostApplyForm";
		}
	}
	
	@RequestMapping("hostApply.sp")
	public String hostApply(int hostId, String memberId, Model model) {
		int result = hService.applyHost(hostId);
		if (result > 0) {
			Host hostInfo = hService.selectOne(memberId);
			if (hostInfo != null) model.addAttribute("host", hostInfo);
			return "host/hostApplyForm";
		} else {
			model.addAttribute("msg", "호스트 신청 오류 발생");
			return "host/hostApplyForm";
		}
	}
	
	@RequestMapping("hostAccount.sp")
	public String hostAccount() {
		return "host/hostAccount";
	}
}
