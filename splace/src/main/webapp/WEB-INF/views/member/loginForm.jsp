<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		<!-- css -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/login.css" type="text/css">
		<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
		
		<noscript><link rel="stylesheet" href="assets/css/noscript.css"/></noscript>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
	
			<div id="wrapper">
		 	<jsp:include page="../common/top.jsp"/> 
			
				<!-- Main -->
					<div id="main">
						<div class="inner">
								<section id="login_wrapper">
										<div class="inner">
											<section class="login_form field bg_L">
												<h2 class="tit_s2 center">LOGIN</h2>
												<form method="POST" action="login.sp">
													<div class="form_box1 fields">
														<div class="col-12 field">
															<input type="text" name="memberId" id="email" placeholder="Email"/>
														</div>										
														<div class="col-12 field">
															<input type="password" name="memberPwd" id="name" placeholder="Password" />
														</div>
													</div>
													<div class="form_box2 field row">
														<div class="col-6">
															<input type="checkbox" id="rememberId" name="rememberId" checked > 
															<label for="rememberId">ID 기억하기</label>
														</div>  
														<div class="col-6 pw_find">
															<c:url var="findPwForm" value="findPwForm.sp"/> 
															<a href="${findPwForm}">비밀번호 찾기</a>
														</div>
													</div>
													<div class="login_btn">
														<input type="submit" value="login" class="button fit"/>
													</div>

													<div class="login_type_wrapper">
														<div class="login_type">
															<a class="button fit primary" href=""> 네이버 로그인</a>
														</div>														
														<div class="login_type">
															<a class="button fit primary" href=""> 카카오 로그인 </a>	
														</div>									
														<div class="login_type">
															<a class="button fit primary" href=""> 구글 로그인</a>
														</div>																	
													</div>
												</form>
											</section>
											<section class="bg_R blur">
												<h2 class="center">JOIN</h2>
													<div class="join_wrapper">
														<div class="col-12 center">
															<p> 회원이 아니신가요 :) ?</p>
														</div>
														<div class="img left join_type">
															<ul>
																<li><a href="#"><span><img class="photo" src="${contextPath}/resources/img/google.png" alt="google"></span></a></li>
																<li><a href="#"><span><img class="photo" src="${contextPath}/resources/img/kakao.png" alt="kakao"></span></a></li>
																<li><a href="#"><span><img class="photo" src="${contextPath}/resources/img/naver.png" alt="naver"></span></a></li>
															</ul>
														</div>
														<div class="join_email col-12 center">
															<div class="center">또는</div>
															<h4>이메일로 가입하기</h4>
														</div>
														<div class="col-12 center"> 
															<c:url var="joinForm" value="joinForm.sp"/>
															<a class="join_btn button" href="${joinForm}">JOIN</a>
														</div>
													</div>
											</section>
										</div>
									</section>
						</div>
					</div>
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
	<jsp:include page="../common/bottom.jsp"/>
	
</html>