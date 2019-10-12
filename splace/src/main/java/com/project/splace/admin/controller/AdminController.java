package com.project.splace.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.splace.admin.model.service.AdminService;
import com.project.splace.admin.model.vo.Account;
import com.project.splace.board.model.vo.Board;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 1. 관리자홈
	@RequestMapping("adminHome.sp")
	public String goAdminHome() {
		return "admin/adminHome";
	}
	
	// 2. 정산페이지로 이동
	@RequestMapping("settlementManagement.sp")
	public ModelAndView goSettlementManagement(HttpSession session, ModelAndView mv, String monthS, RedirectAttributes rd) {
		if(!((Member)session.getAttribute("loginUser")).getMemberId().equals("admin")) {
			rd.addFlashAttribute("msg", "관리자로 로그인해주세요!");
			mv.setViewName("redirect:loginForm.sp"); 
		}else {
			// 월
			int month = 0;
			if(monthS != null) {
				month = Integer.parseInt(monthS);				
			} else{
				month = 0;
			}
			
			ArrayList<Account> aList = adminService.selectAccountList(month);
			System.out.println("정산관리: "+aList);
			
			mv.addObject("aList", aList).addObject("monthS", month).setViewName("admin/settlementManagement");
		}
		
		return mv;
	}
	
	// 3. 회원관리
	@RequestMapping("memberManagement.sp")
	public ModelAndView goMemberManagement(ModelAndView mv, String memberStatus) {
		
		// 상태
		if(memberStatus == null) {
			memberStatus = "Y";
		}
		
		ArrayList<Member> mList = adminService.selectMemberList(memberStatus);
		mv.addObject("mList", mList).addObject("status", memberStatus).setViewName("admin/memberManagement");
		
		return mv; 
	}
	
	// 4. 호스트관리
	@RequestMapping("hostManagement.sp")
	public ModelAndView goHostManagement(ModelAndView mv, String hostStatus) {
		
		// 상태
		int status = 0;
		if(hostStatus == null) {
			status = 4;
		} else{
			status = Integer.parseInt(hostStatus);
		}
		
		ArrayList<Host> hList = adminService.selectHostList(status);
		mv.addObject("hList", hList).addObject("status", status).setViewName("admin/hostManagement");
		
		return mv; 
	}
	
	// 5. faq관리
	@RequestMapping("faqManagement.sp")
	public ModelAndView goFaqManagement(ModelAndView mv) {
		ArrayList<Board> bList = adminService.selectFaqList();
		mv.addObject("bList", bList).setViewName("admin/faqManagement");
		return mv;
	}
}
