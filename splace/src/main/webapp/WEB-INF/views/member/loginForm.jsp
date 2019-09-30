<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
	<!-- template -->
	<noscript><link rel="stylesheet" href="${contextPath }/resources/css/noscript.css"></noscript>
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- css -->	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath }/resources/css/fontawesome-all.min.css" type="text/css">
	<link rel="stylesheet" href="${contextPath}/resources/css/nice-select.css">
	<link rel="stylesheet" href="${contextPath }/resources/css/style.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/css/login.css" type="text/css">
	<link rel="stylesheet" href="${contextPath }/resources/css/common.css" type="text/css">
	
	
	</head>
	<jsp:include page="../common/top.jsp"/>
	
	<body class="is-preload">
			<!-- Wrapper -->
				<div id="wrapper">
	
					<!-- Header -->
		
	
					<!-- Menu -->
	
	
					<!-- Main -->
					<div id="main">
						<div class="inner">
								<div class="common_wrapper row type_2">
										<section class="wrapper_left col-7">
											<form  method="POST" action="login.sp">
												<header class="title_box center col-12">
													<h2> login</h2>
												</header>
												<article class="col-12 form_box1 row">
													<div class="col-12">
														<input type="text" name="memberId" id="memberId" placeholder="Email"/>
													</div>										
													<div class="col-12">
														<input type="password" name="memberPwd" id="memberPwd" placeholder="Password" />
													</div>
												</article>
												<article class="col-12 form_box2 row">
													<div class="form_1 col-6">
														<input type="checkbox" id="rememberId" name="rememberId" checked > 
														<label for="rememberId">ID 기억하기</label>
													</div>  
													<div class="form_2 col-6 ">
														<a>비밀번호 찾기</a>
													</div>
												</article>

					
												<article class="login_type_wrapper col-12 row">
													<div class="login_btn col-12">
														<input type="submit" value="login" class="button fit"/>
													</div>
													<div class="login_type col-12">
														<a class="button fit primary" href="${url}"> 네이버 로그인</a>
													</div>														
													<div class="login_type col-12">
														<a class="button fit primary" href=""> 카카오 로그인 </a>	
													</div>									
													<div class="login_type col-12">
														<a class="button fit primary" href=""> 구글 로그인</a>
													</div>																	
												</article>
											</form>
										</section>
										<section class="wrapper_right  col-5 login_bg">
												<header class="title_box center">
														<h2>JOIN</h2>
												</header>
												<article class="right_form">
													<!-- <div class="col-12 center">
														<h3> 회원이 아니신가요 :) ?</h3>
													</div> -->
													<div class="join_type">
														<ul>
															<li><a href="#"><span><img class="photo" src="${contextPath}/resources/img/google.png" alt="google"></span></a></li>
															<li><a href="#"><span><img class="photo" src="${contextPath}/resources/img/kakao.png" alt="kakao"></span></a></li>
															<li><a href="${url}"><span><img class="photo" src="${contextPath}/resources/img/naver.png" alt="naver"></span></a></li>
														</ul>
													</div>
													<div class="join_email col-12 center">
														<div class="center">또는</div>
														<h4>이메일로 가입하기</h4>
													</div>
										
													<c:url var="joinForm" value="joinForm.sp"/>
													<div class="col-12 center"> 
														<a class="join_btn button fit" href="${joinForm}">JOIN</a>
													</div>
												</article>
										</section>
									</div>
								</div>
							</div>
						</div>		
	
	
					<!-- Footer -->
	
	
	
			<!-- Scripts -->
				<script src="assets/js/jquery.min.js"></script>
				<script src="assets/js/browser.min.js"></script>
				<script src="assets/js/breakpoints.min.js"></script>
				<script src="assets/js/util.js"></script>
				<script src="assets/js/main.js"></script>
	
		</body>
	<jsp:include page="../common/bottom.jsp"/>
	
</html>