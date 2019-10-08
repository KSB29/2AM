package com.project.splace.member.controller;



import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.splace.member.RandomNo;
import com.project.splace.member.model.service.MemberService;
import com.project.splace.member.model.vo.MailVO;
import com.project.splace.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {	

	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService mService;
	
	@Autowired 
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private RandomNo randomNo;
	
	
	
	/* 임시 비밀번호 메일 전송 컨트롤러 */ 
	@RequestMapping(value="findPwMail.sp",method= RequestMethod.POST)
	@ResponseBody
	public int findPwMail(final MailVO vo) {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				
				// 임시 비밀번호용 난수 생성
				String num = randomNo.getKey(10,true);
				
				// 내용 입력
				vo.setContents("임시 비밀번호가 발급되었습니다.");
				vo.setFrom("Splace");
				vo.setSubject("무한한 공간대여 Splace! 임시 비밀번호 발급 메일입니다.");
				String contents =
						"<html lang='ko'>"
								+"<head>"
								+"<style>"
								+".container{height: 1000px}"
								+"h3{letter-spacing: -1px;}"
								+"table{border-collapse:collapse}"
								+"table td{"
								+"border: 1px solid #4c74b8;"
								+"letter-spacing: -1px;"
								+"padding: 10px;"
								+"}"
								+"a.go{"
						        +"position: relative;"
						        +"top: 50px;"
								+"padding: 10px 100px;"
								+"letter-spacing: -1px;"
								+"background-color: #4c74b8; "
								+"color: white;"
								+"border: 0;"
								+"}"
								+"a.go:hover{"
								+"cursor: pointer; "
								+"background-color: transparent;"
								+"border: 1px solid #4c74b8;"
								+"color: #4c74b8"
								+"}"
								+"</style>"
								+"</head>"
								+"<body>"
								+"<div class='container' align='center'>"
								+"<br>"
								+"<h3>"	+"임시비밀번호: "+num+"</h3>"
								+"<br>"
								+"<a class='go' href='http://localhost:8080/splace/loginForm.sp'"
								+">SPLACE로 이동</a>"
								+"</div>"
								+"</body>"
								+"</html>"
						;
				vo.setTemp(num);
				
				logger.info("임시 비밀번호 : "+num);
				logger.info("비밀번호 확인 : "+vo.getTemp());
				
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				helper.setText(contents, true);		
			}
		
		};
		mailSender.send(preparator);
		
		int result = mService.updatePwd(vo);
		
		return result;
	}
	
	@RequestMapping(value="nJoin.sp", method=RequestMethod.POST)
	public String naverJoin(Member mem, ModelAndView mv ) {
		
		int result = mService.insertNaverId(mem);
		
		
		return "redirect:index.jsp";
	}

	
	/* 로그인 폼으로 이동 */ 
	@RequestMapping(value = "loginForm.sp",method= { RequestMethod.POST, RequestMethod.GET})
	public String MemberLoginForm(Model model , HttpSession session) {
		return "member/loginForm";
	}
	
	/* 회원가입 폼으로 이동 */ 
	@RequestMapping("joinForm.sp")
	public String MemberJoinForm() {
		return "member/joinForm";
	}
	
	
	/* 네이버 로그인이동 */ 
	@RequestMapping("njoinForm.sp")
	public String naverJoinForm() {
		return "member/njoinForm";
	}
	
	/* 비밀번호 찾기 폼으로 이동 */ 
	@RequestMapping("findPwForm.sp")
	public String findPwForm() {
		return "member/findPwForm";
	}
	
	@RequestMapping("profileView.sp")
	public String selectProfile() {

		
		return "member/profileView";
	}
	@RequestMapping("changePwForm.sp")
	public String changePwForm() {
		return "member/changePwForm";
	}
	
	@RequestMapping("wishListView.sp")
	public String wishListView() {
		return "member/wishListView";
	}
	@RequestMapping("usageView.sp")
	public String usageView() {
		return "member/usageView";
	}
	@RequestMapping("deleteForm.sp")
	public String deleteForm() {
		
		return "member/deleteForm";
	}
	
	
	
	
	@RequestMapping(value="login.sp", method=RequestMethod.POST)
	public String MemberLogin(Member mem, Model model, RedirectAttributes rd) {
		Member loginUser = mService.loginMember(mem);
	
		if(loginUser==null) {
			boolean fail = true;
			logger.info("login 실패");
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("fail", fail  );
			return "member/loginForm";
		} else {
			if(logger.isInfoEnabled()) {
				model.addAttribute("loginUser", loginUser);				
				logger.info(loginUser.getMemberId()+": login 성공");
			}
			model.addAttribute("loginUser", loginUser);
			return "redirect:index.jsp";
		}

	}
	
	/* 로그아웃 컨트롤러 */ 

	@RequestMapping("logout.sp")
	public String MemberLogout(SessionStatus status, HttpSession session) {
		status.setComplete();
		return "redirect:/";
	}
	
	/* 아이디 중복검사 컨트롤러 */ 
	@RequestMapping(value= "checkId.sp", method=RequestMethod.POST)
	@ResponseBody
	public boolean CheckId(String memberId) {
		
		boolean result = mService.checkId(memberId) == 0 ? true : false; 
		logger.info("아이디:"+ memberId);
		logger.info("결과:"+result );
		
		return result ; 
	}
	
	
	/* 비밀번호 검사 컨트롤러 */
	@RequestMapping(value = "checkPwForm.sp", method=RequestMethod.POST)
	@ResponseBody
	public boolean checkPwd(HttpSession session, Member mem) {
		
		boolean result;
		logger.info(mem.getMemberId());
		logger.info(mem.getMemberPwd());
		
		
		Member checkPwd = mService.checkPwd(mem);
		
		
		if(checkPwd == null) {
			result = false;
			logger.info("비밀번호 확인 실패");	
			return result;
		}else {
			result = true;
			logger.info("비밀번호 확인 성공");
			return result;
		}
		
		
	}
	
	/* 비밀번호 변경 컨트롤러 */ 
	@RequestMapping(value = "changePw.sp", method=RequestMethod.POST)
	public String updatePwd(SessionStatus status, RedirectAttributes rd, Model model , Member mem) {
		
		int result = mService.updatePwd(mem);
	
		
		if(result>0) {
			model.addAttribute("loginUser", mem);
			rd.addFlashAttribute("msg", "비밀번호가 변경되었습니다. 다시 로그인해주세요 :) ");
			status.setComplete();
			return "redirect:loginForm.sp";
		}else {
			model.addAttribute("msg", "비밀번호 변경이 실패했습니다. 다시 한 번 시도해 주세요 :*( ");
			return "redirect:loginForm.sp";	
		}

	}
	
	/* 회원 탈퇴 컨트롤러 */ 
	@RequestMapping("delete.sp")
	public String deleteUser(String memberId, SessionStatus status, 
			RedirectAttributes rdAttr, Model model ) {
		logger.info("회원아이디 :"+ memberId);
		int result = mService.deleteMember(memberId);
		if(result>0) {
			logger.info("회원 탈퇴 성공");
			rdAttr.addFlashAttribute("msg", "정상적으로 탈퇴되었습니다. 다음에 다시만나요 :)");
			status.setComplete(); // 세션 완료
			return "redirect:loginForm.sp";
		}else {
			logger.info("회원 탈퇴 실패");
			rdAttr.addAttribute("msg", "회원 탈퇴에 실패했습니다. 다시 시도해주세요!");
			return "member/deleteForm";
			
		}

	}
	
	/* 회원 가입 컨트롤러 */ 
	@RequestMapping(value="join.sp", method=RequestMethod.POST)
	public String insertMember(Member mem, Model model, HttpServletRequest request){
		
		int result = mService.insertMember(mem);

		if(result>1) {
			return "redirect:loginForm.sp"; 
		}else {
			
			return "redirect:loginForm.sp";
		}
		
		
	}


}
