package com.project.splace.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.splace.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	
	private Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	
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
		String grade = (loginUser).getGrade();
		
		String url = request.getRequestURL().toString();
		url = url.substring(url.lastIndexOf('/'));
		System.out.println(url);
		
		if(loginUser != null) {
			if(!grade.equals("0")) {
				logger.info("잘못된 주소로 [" + request.getRequestURI() + "] 접근");
				
				session.setAttribute("msg", "잘못된 주소로 접근하셨습니다.");
				response.sendRedirect("/splace");
				//request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
				return false;		
			}
		}
		
		// home.jsp로 가서 알람창 띄어주게 작성하고
		// servlet-context.xml에 인터셉터 등록하자
		// 그리고 로그도 사용햇으니깐 logger도 등록하자
		
		return super.preHandle(request, response, handler);
	}
}
