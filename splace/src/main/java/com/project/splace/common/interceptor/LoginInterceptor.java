package com.project.splace.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.splace.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	/*
	 * 1. preHandle (전처리) : DipatcherServlet이 컨트롤러를 호출하기 전
	 * 2. postHandle(후처리) : 컨트롤러에서 DispatcherServlet으로 리턴되는 순간(ModelAndView를 통해 작업결과 참조 가능)
	 * 3. afterCompletion(뷰단처리후) : 모든 뷰에서 최종 결과를 생성하는 일을 포함한 모든 작업이 모두 완료된 후
	 * 								  요청처리 중에 사용한 리소스를 반환해주기에 적당한 메소드
	 * */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			logger.info("비로그인 상태에서 [" + request.getRequestURI() + "] 접근");
			
			session.setAttribute("msg", "로그인 후 이용하세요");
			response.sendRedirect("loginForm.sp");
			//request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
			return false;
		}
		
		// home.jsp로 가서 알람창 띄어주게 작성하고
		// servlet-context.xml에 인터셉터 등록하자
		// 그리고 로그도 사용햇으니깐 logger도 등록하자
		
		return super.preHandle(request, response, handler);
	}
}
