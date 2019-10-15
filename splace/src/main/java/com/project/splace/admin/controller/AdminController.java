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
import com.project.splace.admin.model.vo.TodayBook;
import com.project.splace.board.model.vo.Board;
import com.project.splace.host.model.vo.Host;
import com.project.splace.member.model.vo.Member;
import com.project.splace.qna.model.vo.QnA;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 1. 관리자홈
	@RequestMapping("adminHome.sp")
	public ModelAndView goAdminHome(ModelAndView mv) {
		// 답변요청 문의목록
		ArrayList<QnA> aList = adminService.selectAadminList();
		// 호스트 신청목록
		ArrayList<Host> hList = adminService.selectHostList(1);
		// 공간 신청목록
		// 신규회원(1달)
		ArrayList<Member> mList = adminService.selectNewMemberList();
		// 오늘예약수
		ArrayList<TodayBook> bList = adminService.selectBookList();
		System.out.println(bList);
		
		mv.addObject("aList", aList).addObject("hList", hList).addObject("mList", mList).addObject("bList", bList);
		mv.setViewName("admin/adminHome");
		
		return mv;
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
	@RequestMapping("hhostManagement.sp")
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
	public ModelAndView goFaqManagement(ModelAndView mv, String boardType) {
		// 상태
		int status = 0;
		if(boardType == null) {
			status = 100;
		} else{
			status = Integer.parseInt(boardType);
		}
		
		ArrayList<Board> bList = adminService.selectFaqList(status);
		mv.addObject("bList", bList).addObject("status", status).setViewName("admin/faqManagement");
		return mv;
	}
	
	// 6. 공지사항관리
	@RequestMapping("noticeManagement.sp")
	public ModelAndView goNoticeManagement(ModelAndView mv) {
		ArrayList<Board> bList = adminService.selectNoticeList();
		mv.addObject("bList", bList).setViewName("admin/noticeManagement");
		return mv;
	}
	
	// 7. 호스트문의관리
	@RequestMapping("qnaHostManagement.sp")
	public ModelAndView goQnaHostManagement(ModelAndView mv) {
		ArrayList<QnA> qList = adminService.selectQlist();
		mv.addObject("qList", qList).setViewName("admin/qnaHostManagement");
		
		return mv;
	}
	
	// 8. 관리자문의관리
	@RequestMapping("qnaAdminManagement.sp")
	public ModelAndView goQnaAdminManagement(ModelAndView mv) {
		ArrayList<QnA> qList = adminService.selectQAdminlist();
		mv.addObject("qList", qList).setViewName("admin/qnaAdminManagement");
		
		return mv;
	}
	
	// 9. 호스트 신청 관리
	@RequestMapping("hApplyManagement.sp")
	public ModelAndView hApplyManagement(ModelAndView mv) {
		
		ArrayList<Host> hList = adminService.selectHostList(1);
		mv.addObject("hList", hList).setViewName("admin/hostManagement");
		
		return mv; 
	}
	
	// 10. 관리자답변관리
	@RequestMapping("answerAdminManagement.sp")
	public ModelAndView goAnswerManagement(ModelAndView mv) {
		ArrayList<QnA> aList = adminService.selectAadminList();
		mv.addObject("aList", aList).setViewName("admin/answerAdminManagement");
		
		return mv;
	}
	
	// 11. 관리자답변작성
	@RequestMapping("answerAdmin.sp")
	public String answerAdmin(QnA qna, RedirectAttributes rd, HttpSession session) {
		qna.setaMemberId(((Member)session.getAttribute("loginUser")).getMemberId());
		System.out.println(qna);
		
		int result = adminService.insertAnswerAdmin(qna);
		
		if(result>0) {
			rd.addFlashAttribute("msg", "답변이 작성되었습니다!");
		} else {
			rd.addFlashAttribute("msg", "답변이 작성되지않았습니다ㅜㅜㅜ");
		}
		return "redirect:qnaAdminManagement.sp";
	}
	
}
