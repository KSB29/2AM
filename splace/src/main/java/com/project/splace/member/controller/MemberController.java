package com.project.splace.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.project.splace.member.model.service.MemberService;
import com.project.splace.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {	

	@Autowired
	private MemberService mService;
	
	@RequestMapping("loginForm.sp")
	public String MemberLoginForm() {
		return "member/loginForm";
	}
	
	// 프로젝트용 로그인 
	@RequestMapping(value="login.sp", method=RequestMethod.POST)
	public String MemberLogin(Member mem, Model model) {
		Member loginUser = mService.loginMember(mem);
		
		if(loginUser==null) {
			System.out.println("실패");
		} else {
			System.out.println("성공");
		}

		model.addAttribute("loginUser", loginUser);
		return "redirect:index.jsp";
	}
	
	// 2. 로그아웃
	@RequestMapping("logout.sp")
	public String MemberLogout(SessionStatus status, HttpSession session) {
		status.setComplete();
		return "redirect:/";
	}
	
	@RequestMapping("joinForm.sp")
	public String MemberJoinForm() {
		return "member/joinForm";
	}
}
