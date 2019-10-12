package com.project.splace.host.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.splace.common.Pagination;
import com.project.splace.host.model.service.HostService;
import com.project.splace.host.model.vo.BookList;
import com.project.splace.host.model.vo.Host;
import com.project.splace.host.model.vo.HostSearch;
import com.project.splace.member.model.vo.Member;
import com.project.splace.qna.model.vo.QnA;
import com.project.splace.space.model.vo.Space;

//session에 hostId 추가
@SessionAttributes({"hostId"})
@Controller
public class HostController {
	
	@Autowired
	private HostService hService;
	
	// 호스트 마이페이지 이동
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
	
	// 호스트 정보 등록 처리 후 마이페이지 이동
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
	
	// 호스트 정보 수정 처리 후 마이페이지 이동
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
	
	// 호스트 승인 요청 처리 후 마이페이지 이동
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
	
	// 예약 리스트 페이지 이동
	@RequestMapping("hostBookList.sp")
	public ModelAndView hostBookList(HttpSession session, HostSearch search, ModelAndView mv, Integer page) {
		int hostId = (int)session.getAttribute("hostId");
		int currentPage = page == null? 1 : page;
		search.setHostId(hostId);
		
		ArrayList<BookList> bList = hService.selectBookList(search, currentPage);
		ArrayList<Space> sList = hService.selectSpaceList(hostId);
		//ArrayList<Status> status = hService.selectStatus();
		
		if (bList != null) {
			mv.addObject("search", search).addObject("bList", bList).addObject("sList", sList)
			.addObject("pi", Pagination.getPageInfo()).setViewName("host/hostBookList");
		} else {
			mv.addObject("msg", "예약리스트 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 예약 승인/취소 처리(Ajax)
	@ResponseBody
	@RequestMapping("hostApplyBook.sp")
	public String bookApply(HttpSession session, String statusId, String list) {
		int hostId = (int)session.getAttribute("hostId");
		int result = hService.updateApplyBook(statusId, list);
		// 처리 건 수 리턴
		if (result > 0) return result + "";
		else return "0";
	}
	
	// 공간 문의 리스트 조회
	@RequestMapping("hostQna.sp")
	public ModelAndView hostQna(HttpSession session, HostSearch search, ModelAndView mv, Integer page) {
		int hostId = (int)session.getAttribute("hostId");
		int currentPage = page == null? 1 : page;
		search.setHostId(hostId);
		
		System.out.println(search.getSpaceId());
		System.out.println(search.getStatusId());
		
		ArrayList<QnA> qList = hService.selectQnaList(search, currentPage);
		ArrayList<Space> sList = hService.selectSpaceList(hostId);
		if (qList != null) {
			mv.addObject("search", search).addObject("qList", qList).addObject("sList", sList)
			.addObject("pi", Pagination.getPageInfo()).setViewName("host/hostQna");
		} else {
			mv.addObject("msg", "공간 문의 리스트 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("hostAccount.sp")
	public String hostAccount() {
		return "host/hostAccount";
	}
}
