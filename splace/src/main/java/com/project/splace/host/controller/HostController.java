package com.project.splace.host.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.splace.common.Pagination;
import com.project.splace.host.model.service.HostService;
import com.project.splace.host.model.vo.BookList;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;
import com.project.splace.space.model.service.SpaceService;
import com.project.splace.space.model.vo.Space;

//session에 hostId 추가
@SessionAttributes({"hostId"})
@Controller
public class HostController {
	
	@Autowired
	private HostService hService;
	
	@Autowired
	private SpaceService sService;
	
	@RequestMapping("hostApplyForm.sp")
	public ModelAndView hostApplyForm(HttpSession session, ModelAndView mv) {
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		// memberId로 로그인 여부 확인
		if (memberId != null) {
			Host hostInfo = hService.selectOne(memberId);
			// 등록된 host 정보가 있을 경우에만
			if (hostInfo != null) {
				mv.addObject("host", hostInfo).addObject("hostId", hostInfo.getHostId()); // hostId session 추가용
			}
			mv.setViewName("host/hostApplyForm");
		} else {
			mv.setViewName("redirect:loginForm.sp");
		}
		return mv;
	}
	
	@RequestMapping("hostInsert.sp")
	public ModelAndView hostInsert(Host host, ModelAndView mv) {
		Host hostInfo = hService.insertHost(host);
		// 호스트 등록 후 승인 요청가능하도록 등록 페이지 다시 이동
		if (hostInfo != null) {
			mv.addObject("host", hostInfo).addObject("hostId", hostInfo.getHostId()).setViewName("host/hostApplyForm"); // hostId session 추가용
		} else {
			mv.addObject("msg", "호스트 등록 및 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("hostUpdate.sp")
	public ModelAndView hostUpdate(Host host, ModelAndView mv) {
		Host hostInfo = hService.updateHost(host);
		if (hostInfo != null) {
			mv.addObject("host", hostInfo).setViewName("host/hostApplyForm");
		} else {
			mv.addObject("msg", "호스트 수정 및 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("hostApply.sp")
	public ModelAndView hostApply(HttpSession session, ModelAndView mv) {
		int hostId = (int)session.getAttribute("hostId");
		Host hostInfo = hService.updateApplyHost(hostId);
		if (hostInfo != null) {
			mv.addObject("host", hostInfo).setViewName("host/hostApplyForm");
		} else {
			mv.addObject("msg", "호스트 신청 및 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("hostBookList.sp")
	public ModelAndView bookList(HttpSession session, ModelAndView mv, Integer page) {
		int hostId = (int)session.getAttribute("hostId");
		int currentPage = page == null? 1 : page;
		ArrayList<BookList> bList = hService.selectBookList(hostId, currentPage);
		ArrayList<Space> sList = hService.selectSpaceList(hostId);
		//ArrayList<Status> status = hService.selectStatus();
		if (bList != null) {
			mv.addObject("bList", bList).addObject("sList", sList).addObject("pageInfo", Pagination.getPageInfo()).setViewName("host/hostBookList");
		} else {
			mv.addObject("msg", "예약리스트 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("hostAccount.sp")
	public String hostAccount() {
		return "host/hostAccount";
	}
}
