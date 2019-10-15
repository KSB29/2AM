package com.project.splace.member.controller;



import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.util.TextUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.splace.common.Pagination;
import com.project.splace.host.model.vo.HostSearch;
import com.project.splace.member.KakaoLoginBO;
import com.project.splace.member.NaverLoginBO;
import com.project.splace.member.RandomNo;
import com.project.splace.member.model.service.MemberService;
import com.project.splace.member.model.vo.AuthInfo;
import com.project.splace.member.model.vo.MailVO;
import com.project.splace.member.model.vo.Member;
import com.project.splace.member.model.vo.WishListVO;
import com.project.splace.review.model.vo.Review;
import com.project.splace.space.model.vo.Space;

@SessionAttributes("loginUser")
@Controller
public class MemberController {	

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService mService;
	
	
	/* 메일 전송 */
	@Autowired 
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private RandomNo randomNo;
	
	private String apiResult = null;
	
	/* NaverLoginBO */	
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}
	
	/* kakaoLoginBO */	
	@Autowired
	private KakaoLoginBO kakaoLoginBO;
	
	/* GoogleLogin */	
    @Inject
    private AuthInfo authInfo;
    
    @Autowired
    private GoogleOAuth2Template googleOAuth2Template;
    
    @Autowired
	private OAuth2Parameters googleOAuth2Parameters;
    
    
    

    
    
	
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
	public String naverJoin(Member mem, Model model ) {
		if(TextUtils.isEmpty(mem.getMemberAgree())) {
			mem.setMemberAgree("N");
		}
		
		int result  = mService.insertSocialMember(mem);
		Member loginUser = mService.loginSocialMember(mem.getMemberId());
		
		
		if(result>0) {
			
			if(loginUser!=null){
				logger.info("회원가입 성공");
				model.addAttribute("msg", "Splace에 오신걸 환영합니다 :)");
				model.addAttribute("loginUser", loginUser);
				return "redirect:index.jsp";
				
			}else{
				boolean fail = true;
				logger.info("login 실패");
				model.addAttribute("fail", fail);
				model.addAttribute("msg", "로그인에 실패했습니다. 다시 시도해 주세요 :*(");
				model.addAttribute("loginUser", loginUser);
				return "redirect:loginForm.sp";
			}
			
		}else{

			logger.info("회원가입 실패");
			model.addAttribute("result", apiResult);
			model.addAttribute("msg","회원가입에 실패했습니다 :*( 다시 시도해주세요!");
			return "redirect:loginForm.sp";
		}
		
		
	}
	
	/* 로그인 폼으로 이동 */ 
	@RequestMapping(value = "loginForm.sp",method= {RequestMethod.POST, RequestMethod.GET})
	public String MemberLoginForm(HttpServletResponse response,  Model model , HttpSession session) {

       
        // KaKao URL 생성
        String kakaoUrl = kakaoLoginBO.getAuthorizationUrl(session);

        // Kakao URL 전송  
        model.addAttribute("kakao_url", kakaoUrl);
        
        // Google URL 생성
        String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        logger.info("googleLogin, url : " + url);
      
        // Google URL 전송
        model.addAttribute("google_url", url);
		
        // Naver URL 생성
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		// Naver URL 전송
		model.addAttribute("url", naverAuthUrl);	
		
		return "member/loginForm";
		
		
	}
	
	 @RequestMapping(value = "kjoinForm.sp")
	 public String KakaoLogIn(ModelMap model,@RequestParam("code") String code, HttpSession session) throws Exception {

		  JsonNode userInfo = kakaoLoginBO.getKakaoUserInfo(code);

		  logger.info("유저 정보" + userInfo);
		  

		  //String id = userInfo.get("id").toString();
		  String memberId = userInfo.get("kaccount_email").toString().replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		  //String image = userInfo.get("properties").get("profile_image").toString();
		  //String nickname = userInfo.get("properties").get("nickname").toString();
		  //model.addAttribute("k_userInfo", userInfo);
		  //model.addAttribute("id", id);
		  //model.addAttribute("email", email);
		  //model.addAttribute("nickname", nickname);
		  //model.addAttribute("image", image);
		  Member loginUser = mService.loginSocialMember(memberId);
		  memberId.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
		  logger.info("카카오 아이디: " + memberId);


		  if(loginUser == null) {
			  
			  logger.info("회원가입 페이지로 이동");
			  logger.info("카카오 아이디: " + memberId);
			  model.addAttribute("id", memberId);
			  return "member/kjoinForm";
			  
		  }else{
			  
			  logger.info("카카오 로그인 성공");
			  logger.info("카카오 아이디: " + memberId);
			  model.addAttribute("loginUser",memberId);
			  return "redirect:index.jsp";
		 
		  }


		 
	 }
	 	@RequestMapping(value = "kjoin.sp")
	    public String kakaoJoin(Member mem, HttpServletRequest request, Model model) throws Exception {
	 		
	 		int result = mService.insertSocialMember(mem);
	        Member loginUser = mService.loginSocialMember(mem.getMemberId());
	        
	 		if(result>0) {
	 			
	 			if(loginUser != null) {
		 			logger.info("회원가입 성공");
					model.addAttribute("msg", "Splace에 오신걸 환영합니다 :)");
		 			model.addAttribute("loginUser", mem);
					return "redirect:index.jsp"; 		
	 			}else{
					model.addAttribute("msg", "로그인에 실패했습니다. 다시 시도해 주세요 :*(");
					model.addAttribute("loginUser", loginUser);
					return "redirect:loginForm.sp";
				}
 		
	 		}else {
	 			logger.info("회원가입 실패");
	 			model.addAttribute("msg","회원가입에 실패했습니다 :*( 다시 시도해 주세요." );
	 			return "redirect:loginForm.sp";
	 		}	
	 	}

	 	@RequestMapping(value = "gjoinForm.sp")
	    public String googleLogin(HttpServletRequest request, Model model) throws Exception {
	 
	        String code = request.getParameter("code");
	        logger.info(code);
	        
	        //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
	        RestTemplate restTemplate = new RestTemplate();
	        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
	        parameters.add("code", code);
	        parameters.add("client_id", authInfo.getClientId());
	        parameters.add("client_secret", authInfo.getClientSecret());
	        parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
	        parameters.add("grant_type", "authorization_code");
	 
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
	        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
	        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
	        Map<String, Object> responseMap = responseEntity.getBody();
	 
	        // id_token 라는 키에 사용자가 정보가 존재한다.
	        // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
	        // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
	        //Base 64로 인코딩 되어 있으므로 디코딩한다.
	 
	        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
	        Base64 base64 = new Base64(true);
	        String body = new String(base64.decode(tokens[1]));
	        
	        logger.info("토큰 길이 : "+tokens.length);
	        logger.info(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
	        logger.info(new String(Base64.decodeBase64(tokens[1]), "utf-8"));
	 
	        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
	        
	   
	        ObjectMapper mapper = new ObjectMapper();
	        Map<String, String> data = mapper.readValue(body, Map.class);
	        logger.info(data.get("email"));
	        String memberId = data.get("email");
	        		
	        Member loginUser = mService.loginSocialMember(memberId);
	        
	        if(loginUser == null) {
				logger.info("google 회원가입페이지로 이동");
				logger.info("구글 아이디"+memberId);
		        model.addAttribute("memberId", memberId);
	        	return "member/gjoinForm";	    
	        	
	        }else {
				logger.info("login 성공");
	        	model.addAttribute("loginUser",loginUser);
	        	return "redirect:index.jsp";
	        }
	    
	        
	    }
	 
	    @RequestMapping(value = "gjoin.sp", method=RequestMethod.POST)
		public String googleJoinForm(Member mem, HttpServletRequest request, Model model) throws Exception {
			
	    	// memberAgree 가 null 인경우'N' 저장
	    	if(TextUtils.isEmpty(mem.getMemberAgree())) {
				mem.setMemberAgree("N");
			}
	
	    	int result = mService.insertSocialMember(mem);
			Member loginUser = mService.loginSocialMember(mem.getMemberId());

			if(result>0) {
				
				if(loginUser!=null){
					logger.info("회원가입 성공");
					model.addAttribute("msg", "Splace에 오신걸 환영합니다 :)");
					model.addAttribute("loginUser", loginUser);
					return "redirect:index.jsp";
					
				}else{
					model.addAttribute("msg", "로그인에 실패했습니다. 다시 시도해 주세요 :*(");
					model.addAttribute("loginUser", loginUser);
					return "redirect:loginForm.sp";
				}
				
			}else{
				logger.info("회원가입 실패");
				model.addAttribute("Member", mem);
				model.addAttribute("msg","회원가입에 실패했습니다 :*( 다시 시도해주세요!");
				return "redirect:loginForm.sp";
			}
	    }
	       
	             
	
	
	/* 회원가입 폼으로 이동 */ 
	@RequestMapping("joinForm.sp")
	public String MemberJoinForm() {
		return "member/joinForm";
	}
	
	
	/* 네이버 로그인이동 */ 
	@RequestMapping("njoinForm.sp")
	public String naverJoinForm(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		logger.info("네이버 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"hwang","age":"20-29","gender":"M","email":"tjdcksghkd12@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
			
		String memberId = (String)response_obj.get("email");
		logger.info(memberId);
		Member loginUser = mService.loginSocialMember(memberId);
		
		if(loginUser == null) {
			model.addAttribute("result", apiResult);
			return "member/njoinForm";	
		}else{
			logger.info("login 성공");
			model.addAttribute("loginUser",loginUser); 	
			return "redirect:index.jsp";
		}
		
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

	@RequestMapping("usageView.sp")
	public String usageView() {
		return "member/usageView";
	}
	@RequestMapping("deleteForm.sp")
	public String deleteForm() {
		
		return "member/deleteForm";
	}
	@RequestMapping("userReviewList.sp")
	public String userReviewList() {
		
		return "member/userReview";
	}
	/*
	@RequestMapping("userReviewList.sp")
	public ModelAndView hostReview(HttpSession session, ModelAndView mv, Integer page) {
		String memberId = (String)session.getAttribute("loginUser");
		int currentPage = page == null? 1 : page;
		//search.setHostId(memberId);
		
		//ArrayList<Review> rList = mService.selectReviewList(search, currentPage);
		//ArrayList<Space> sList = mService.selectSpaceList(memberId);
		
		//if (rList != null) {
		//	mv.addObject("rList", rList).addObject("sList", sList)
			mv.addObject("pi", Pagination.getPageInfo()).setViewName("member/uReview");
		//} else {
		//	mv.addObject("msg", "후기리스트 조회 중 오류 발생").setViewName("common/errorPage");
		//}
		return mv;
	}
	*/
	
	@RequestMapping(value="login.sp", method=RequestMethod.POST)
	public String MemberLogin(Member mem, Model model, RedirectAttributes rd){
		Member loginUser = mService.loginMember(mem);
		
		if(loginUser==null) {
			boolean fail = true;
			logger.info("login 실패");
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("fail", fail);
			return "member/loginForm";
		} else {
			if(logger.isInfoEnabled()) {
				model.addAttribute("loginUser", loginUser);				
				logger.info(loginUser.getMemberId() + ": login 성공");
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
			rd.addFlashAttribute("비밀번호가 변경되었습니다. 다시 로그인해주세요 :) ");
			status.setComplete();
			return "redirect:loginForm.sp";
		}else {
			model.addAttribute("msg", "비밀번호 변경이 실패했습니다. 다시 한 번 시도해 주세요 :*( ");
			return "redirect:loginForm.sp";	
		}

	}
	
	// 전화번호 수정 컨트롤러  
	@RequestMapping(value ="updatePhoneNo.sp", method=RequestMethod.POST)
	@ResponseBody
	public boolean updatePhone(RedirectAttributes rd, Model model , Member mem) {
		boolean result = mService.updatePhone(mem) == 0? false : true ;
		if(result) {
			model.addAttribute("memberPhone" ,mem.getMemberPhone());
			rd.addFlashAttribute("성공적으로 변경되었습니다 :)");
			return result;
		}else {
			return result;	
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
			rdAttr.addFlashAttribute("정상적으로 탈퇴되었습니다. 다음에 다시만나요 :)");
			status.setComplete(); // 세션 완료
			return "redirect:loginForm.sp";
		}else {
			logger.info("회원 탈퇴 실패");
			rdAttr.addAttribute("회원 탈퇴에 실패했습니다. 다시 시도해주세요!");
			return "member/deleteForm";
		}

	}
	
	/* 회원 가입 컨트롤러 */ 
	@RequestMapping(value="join.sp", method=RequestMethod.POST)
	public String insertMember(Member mem, Model model, HttpServletRequest request){
		if(TextUtils.isEmpty(mem.getMemberAgree())) {
			mem.setMemberAgree("N");
		}
		logger.info("이메일 발송 동의 여부 " + mem.getMemberAgree());
		int result = mService.insertMember(mem);

		if(result>1) {
			return "redirect:loginForm.sp"; 
		}else {
			
			return "redirect:loginForm.sp";
		}
	}

	/* wishList 관련 controller*/
	@RequestMapping(value = "wishListView.sp" , method=RequestMethod.GET)
	public ModelAndView wishListView(ModelAndView mv, Member mem, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		String memberId = member.getMemberId();
		logger.info("회원ID : "+memberId);
		ArrayList<WishListVO> wishList = mService.selectWishList(memberId);
		
		if(wishList != null) {
			mv.addObject("wishList", wishList);
			mv.setViewName("member/wishListView");	
		}else {
			mv.addObject("wishList", wishList);
			mv.setViewName("member/wishListView");	
		}
				
		return mv;
	}
}
