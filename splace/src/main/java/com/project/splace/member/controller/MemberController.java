package com.project.splace.member.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.splace.member.model.service.MemberService;
import com.project.splace.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {	

	@Autowired
	private MemberService mService;
//	@Autowired
//	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
//	this.naverLoginBO = naverLoginBO;
//	}
	

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	
	/* Form */ 
	@RequestMapping(value = "loginForm.sp",method= { RequestMethod.POST, RequestMethod.GET})
	public String MemberLoginForm(Model model , HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//		String naverAuthUrl =  naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		logger.info("네이버: "+ naverAuthUrl);

		//네이버
		
//		model.addAttribute("url", naverAuthUrl);
	
		return "member/loginForm";
	}
	@RequestMapping("joinForm.sp")
	public String MemberJoinForm() {
		return "member/joinForm";
	}
	
	
	
	@RequestMapping("njoinForm.sp")
	public String naverJoinForm() {
		return "member/njoinForm";
	}
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


	/* NaverLoginBO */
//	private NaverLoginBO naverLoginBO;
//	private String apiResult = null;

	

	//네이버 로그인 성공시 callback호출 메소드


	/*
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException, org.json.simple.parser.ParseException {
	System.out.println("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	
	1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	
	/*
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	/*
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 이메일값 파싱
	String email = (String)response_obj.get("email");
	logger.info(email);
	//4.파싱 이메일 세션으로 저장
	session.setAttribute("sessionId",email); //세션 생성
	model.addAttribute("result", apiResult);
	return "member/njoinForm";
	}*/
	
	
	/*
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
	session.invalidate();
	return "redirect:/";
	}*/
	
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
	
	// 로그아웃
	@RequestMapping("logout.sp")
	public String MemberLogout(SessionStatus status, HttpSession session) {
		status.setComplete();
		return "redirect:/";
	}
	
	// 회원가입 
	@RequestMapping(value= "checkId.sp", method=RequestMethod.POST)
	@ResponseBody
	public boolean CheckId(String memberId) {
		
		boolean result = mService.checkId(memberId) == 0 ? true : false; 
		logger.info("아이디:"+ memberId);
		logger.info("결과:"+result );
		
		return result ; 
	}
	
	
	
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
